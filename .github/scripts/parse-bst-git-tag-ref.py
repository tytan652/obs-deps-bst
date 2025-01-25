import argparse
import logging
import os
import re
import sys
import yaml


def main() -> int:
    parser = argparse.ArgumentParser(
        description="Parse BuildStream git_tag element ref"
    )
    parser.add_argument(
        "bst_element",
        metavar="FILE",
        type=str,
        help="BuildStream Element with the ref to parse",
    )
    parser.add_argument(
        "--loglevel", type=str, help="Set log level", default="WARNING", required=False
    )

    arguments = parser.parse_args()

    logging.basicConfig(level=arguments.loglevel, format="%(message)s")
    logger = logging.getLogger()

    bst_file = arguments.bst_element

    try:
        with open(bst_file, "r") as file:
            element = yaml.safe_load(file)

            if "sources" not in element:
                logger.error("❌ Element have no sources")
                return 2

            source = list(
                filter(
                    lambda s: "kind" in s and s["kind"] == "git_tag", element["sources"]
                )
            )

            if len(source) == 0:
                logger.error("❌ Element have no git_tag kind source")

            if len(source) > 1:
                logger.error("❌ Element have more that one git_tag kind")

            git_tag = source[0]

            if "ref" not in git_tag:
                logger.error("❌ Source have no git_tag ref")

            m = re.match(r"(?P<tag>.*)-0-g(?P<commit>.*)", git_tag["ref"])
            if not m:
                logger.error("❌ Failed to parse git_tag ref")

            if "tag" not in m.groupdict():
                logger.error("❌ Failed to find tag in git_tag ref")

            if "commit" not in m.groupdict():
                logger.error("❌ Failed to find commit in git_tag ref")

            tag = m.group("tag")
            commit = m.group("commit")

            if "GITHUB_OUTPUT" in os.environ:
                try:
                    with open(os.environ["GITHUB_OUTPUT"], "a") as output:
                        output.write(f"tag={tag}\n")
                        output.write(f"commit={commit}\n")
                except IOError:
                    logger.error("❌ Unable to output in GITHUB_OUTPUT")
                    return 2

            logger.info(f"✅ Ref has tag '{tag}' and commit '{commit}'")

    except IOError:
        logger.error(f"❌ Unable to read BuildStream element file '{bst_file}'")
        return 2

    return 0


if __name__ == "__main__":
    sys.exit(main())
