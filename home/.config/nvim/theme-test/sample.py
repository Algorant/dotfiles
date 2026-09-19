"""Verdigris Python sample.

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer moss,
aqua vitae fermentum, sem justo luctus nibh, non cursus neque risus at erat.
"""

from __future__ import annotations

from dataclasses import dataclass, field
from typing import Iterable


DEFAULT_PLANTS = ("fern", "sage", "mint")


@dataclass(slots=True)
class Garden:
    name: str
    plants: dict[str, int] = field(default_factory=dict)
    watered: bool = False

    def plant(self, label: str, count: int = 1) -> None:
        if count <= 0:
            raise ValueError("count must be positive")
        self.plants[label] = self.plants.get(label, 0) + count

    def extend(self, labels: Iterable[str]) -> list[str]:
        added: list[str] = []
        for label in labels:
            self.plant(label)
            added.append(label.upper())
        return added


async def main() -> Garden:
    garden = Garden("verdant testbed")
    garden.extend(DEFAULT_PLANTS)
    garden.plant("blue hosta", count=3)

    # TODO: make sure TODO is visible but not obnoxious.
    print(f"{garden.name}: {garden.plants!r}")
    return garden
