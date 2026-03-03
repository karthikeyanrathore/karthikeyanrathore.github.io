---
layout: post
title: "qwen 3.5 0.8b feels huge on an m1 8gb"
date:   2026-03-03
categories: llm
---

There is something uniquely satisfying about running a real model locally on a small machine and still getting useful output. The Qwen 3.5 0.8B model is tiny on paper, but in practice it feels huge when you see it respond quickly and consistently on a base Mac M1 with 8 GB RAM. It is only an **800 million parameter model**.

![Qwen 3.5 0.8B local run sample](/assets/img/qwen-0-8b-m1.jpg)

## A real example on macOS

Here is the exact command I used with Ollama:

```bash
ollama run qwen3.5:0.8b ~/Downloads/IMG_0658.jpg "whats in the image"
```

Even with MLX not available on this box, it still delivered a full answer. The logs looked like this:

```text
Mar  2 2026 03:26:20 - ERROR - generated.c:2302 - CHECK failed: mlx_array_item_float16_
2026/03/03 23:53:40 ERROR Failed to load MLX dynamic library symbols path=/Applications/Ollama.app/Contents/Resources/libmlxc.dylib
2026/03/03 23:53:40 WARN MLX dynamic library not available error="failed to load MLX dynamic library (searched: [/Applications/Ollama.app/Contents/Resources /Users/vagrant/build/lib/ollama])"
Added image '/Users/vagrant/Downloads/IMG_0658.jpg'
Thinking...
```

That is the kind of resilience I want from a local setup: even when an acceleration path is missing, the model keeps going and gives a useful answer.

## Final output

Here is the real output from the run:

<details>
<summary>Show full output</summary>

<pre style="white-space: pre-wrap; word-break: break-word;"><code>
Thinking...
The user wants me to describe what is in the image.

1.  **Identify the main subject:** It's a wooden table set up for dining.
2.  **Break down the components:**
    *   **Top Left:** A white plate with remnants of food (looks like a folded pastry or sandwich, green sauce) and empty space. Wait, looking closer at the top left plate, it has a triangular piece of
folded food (maybe a quiche or baguette slice) and some sauce residue.
    *   **Top Right:** A metal basket filled with golden-brown french fries/pastries (looks like chicken or sweet potato fries). There's also a fork and a napkin with "Nik Bakery" written on it.
    *   **Center/Main Focus:** The largest item is a round pizza. It looks like an American-style flatbread pizza.
        *   **Toppings:** Cheese, pepperoni (visible as brown chunks), green bell peppers (circular slices), onions (white slices/roasts).
        *   **Tiers:** There appear to be 3 or 4 distinct triangular cuts visible. One piece is being lifted by two tongs. The base is partially on the plate.
        *   **Utensils:** Two metal tongs lifting the slice in the center, and a fork resting on the edge of the pizza/plate area (partially under the stack). Wait, let me re-examine the tongs. Yes, two
tongs are holding up a slice in the middle.
    *   **Right Side:** A white plate with remnants of food. Looks like a burger patty and maybe some sauce. A fork is visible on the edge.
    *   **Foreground/Bottom:** A few plastic containers (maybe bowls or cups) resting under the pizza, likely for leftovers.
    *   **Tableware:** Forks and knives lying next to each other near the top left plate.

3.  **Synthesize the description:**
    *   Start with the overall setting: An overhead shot of a wooden table with several plates and food items.
    *   Describe the pizza: Round, appetizing pizza with cheese, peppers, onions, and visible chunks of pepperoni or ham. It has been cut into triangular slices; one is held up by tongs. There's some
base on a white plate underneath it. Mention the 3-4 distinct pieces/tiers.
    *   Describe the side dishes:
        *   Basket with French fries (or sweet potato) from a basket called "Nik Bakery".
        *   Plate to the left with leftover food (baguette/pizza slice and sauce).
        *   Plate on the right with what looks like a burger patty.
    *   Describe the utensils: Forks and knives resting near the top left plate.
    *   Mention the napkin: "Nik Bakery" paper napkin in the basket.

4.  **Refine the details:**
    *   The pizza has green pepper strips scattered on it.
    *   The fries look a bit thick or maybe are just regular fries with a crust.
    *   The top left plate is quite empty, almost half full of sauce residue and one piece of pastry/sandwich.
    *   The items in the basket are clearly French fries (crispy edges visible).

5.  **Final Structure:**
    *   **Overview:** Food on a wooden table.
    *   **Pizza Section:** Focus on the pizza with peppers/onions, pepperoni, and the slice being lifted. Mention the tongs.
    *   **Side dishes/Fries:** French fries in a wire basket.
    *   **Other Plates:** One with leftover food (top left), one with a burger patty (right).
    *   **Utensils/Napkins:** Forks/knives near top, napkin at top right.

This covers all the key elements. I will write it out clearly.
...done thinking.

Based on the image, here is what is on the wooden table:

**The Pizza (Center Focus)**
The most prominent item is a round, appetizing-looking American-style flatbread pizza. It appears to have toppings including melted cheese, slices of white onion, green bell pepper strips, and chunks of
what looks like pepperoni or ham. It has been sliced into triangular pieces; in the center, two metal tongs are lifting a slice from the main body. Underneath the pizza rests another white plate, likely
holding leftover base dough or other toppings.

**The Sides & Basket Items**
*   **French Fries (Top Right):** There is a wire basket filled with golden-brown french fries (possibly sweet potato or chicken fries) and a fork resting next to it. A napkin with "Nik Bakery" printed
on it sits on the table near the basket.
*   **Left Plate (Top Left):** A white plate is partially empty, containing remnants of food including a triangular slice of folded dough (likely a quiche or baguette) and green sauce residue.
*   **Right Plate (Far Right):** On the edge of another plate, you can see a burger patty and some white sauce or salad mix remaining.

**Utensils & Tableware**
*   Forks and knives are lying next to each other near the top left.
*   A few plastic containers (bowl sides) are visible in the bottom center, likely holding leftover pizza bases or toppings.

</code></pre>

</details>

## What makes Qwen 0.8B special

- The small size makes it a practical daily driver on laptops.
- It is fast enough to keep a flow state when you are iterating on prompts.
- It gives you an always-on assistant without paying for tokens or waiting on a network.

If you are on a base M1 with 8 GB RAM, Qwen 3.5 0.8B is one of the best local-model experiences right now. It proves that local LLMs do not need to be huge to be genuinely useful.
