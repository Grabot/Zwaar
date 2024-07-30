<script>
	import { onMount } from "svelte";
    import Hexagon from "./Hexagon.svelte";
		
	// A box and corresponding width and height value of the box.
	// The box is set to the full screen width and height 
	// and we observe the box for any changes in the size
	let screenBox;
	let screenWidth = -1;
	let screenHeight = -1;
	let hexSize = -1;

	// The hexagons list has the attributes for the Hexagons and the hex list will hold the objects.
	let hexagons = [];
    let hex = [];
	onMount(() => {
		const resizeObserver = new ResizeObserver(entries => {
			const entry = entries.at(0);

			screenWidth = entry.contentRect.width;
			screenHeight = entry.contentRect.height;
			if (screenWidth > screenHeight) {
				hexSize = screenWidth / 20;
			} else {
				hexSize = screenHeight / 20;
			}
			for (let i = 0; i <= hex.length - 1; i++) {
				hex[i].updateHexagon(hexSize);
			}
		});
		resizeObserver.observe(screenBox);
		return () => resizeObserver.unobserve(screenBox);
	});

	// Not the cleanest solution, but we will manually define all the hexagons that we want to display.
	// This gives us full control to the final visual result.
	// We will use the q, r, s coordinates system even though just q, r should be sufficient.
	// It should hold for all hexagons that q + r + s == 0
	// The center hexagon
	hexagons.push([0, 0, hexSize]);
	// The first layer (6 neighbours of the center)
	hexagons.push([0, -1, 1]);
	hexagons.push([1, -1, 0]);
	hexagons.push([1, 0, -1]);
	hexagons.push([0, 1, -1]);
	hexagons.push([-1, 1, 0]);
	hexagons.push([-1, 0, 1]);
	// The second layer
	hexagons.push([0, -2, 2]);
	hexagons.push([1, -2, 1]);
	hexagons.push([2, -2, 0]);
	hexagons.push([2, -1, -1]);
	hexagons.push([2, 0, -2]);
	hexagons.push([1, 1, -2]);
	hexagons.push([0, 2, -2]);
	hexagons.push([-1, 2, -1]);
	hexagons.push([-2, 2, 0]);
	hexagons.push([-2, 1, 1]);
	hexagons.push([-2, 0, 2]);
	hexagons.push([-1, -1, 2]);
	// The third layer
	hexagons.push([0, -3, 3]);  // The top
	hexagons.push([1, -3, 2]);
	hexagons.push([2, -3, 1]);
	hexagons.push([3, -3, 0]);
	hexagons.push([3, -2, -1]);
	hexagons.push([3, -1, -2]);
	hexagons.push([3, 0, -3]);
	hexagons.push([2, 1, -3]);
	hexagons.push([1, 2, -3]);
	hexagons.push([0, 3, -3]);  // The bottom
	hexagons.push([-1, 3, -2]);
	hexagons.push([-2, 3, -1]);
	hexagons.push([-3, 3, 0]);
	hexagons.push([-3, 2, 1]);
	hexagons.push([-3, 1, 2]);
	hexagons.push([-3, 0, 3]);
	hexagons.push([-2, -1, 3]);
	hexagons.push([-1, -2, 3]);
	// The fourth layer
	// hexagons.push([0, -4, 4]);  // The top
	hexagons.push([1, -4, 3]);  // next to the top
	hexagons.push([2, -4, 2]);  // next to the top
	hexagons.push([3, -4, 1]);
	hexagons.push([4, -4, 0]);
	hexagons.push([4, -3, -1]);
	hexagons.push([4, -2, -2]);
	hexagons.push([4, -1, -3]);
	hexagons.push([4, 0, -4]);
	hexagons.push([3, 1, -4]);
	hexagons.push([2, 2, -4]);  // next to the bottom
	hexagons.push([1, 3, -4]);  // next to the bottom
	// hexagons.push([0, 4, -4]);  // The bottom
	hexagons.push([-1, 4, -3]);  // next to the bottom
	hexagons.push([-2, 4, -2]);  // next to the bottom
	hexagons.push([-3, 4, -1]);
	hexagons.push([-4, 4, 0]);
	hexagons.push([-4, 3, 1]);
	hexagons.push([-4, 2, 2]);
	hexagons.push([-4, 1, 3]);
	hexagons.push([-4, 0, 4]);
	hexagons.push([-3, -1, 4]);
	hexagons.push([-2, -2, 4]);  // next to the top
	hexagons.push([-1, -3, 4]);  // next to the top
	// // The fifth layer
	// hexagons.push([0, -5, 5]);
	// hexagons.push([1, -5, 4]);
	// hexagons.push([2, -5, 3]);
	hexagons.push([3, -5, 2]);
	hexagons.push([4, -5, 1]);
	hexagons.push([5, -5, 0]);
	hexagons.push([5, -4, -1]);
	hexagons.push([5, -3, -2]);
	hexagons.push([5, -2, -3]);
	hexagons.push([5, -1, -4]);
	hexagons.push([5, 0, -5]);
	hexagons.push([4, 1, -5]);
	hexagons.push([3, 2, -5]);
	// hexagons.push([2, 3, -5]);
	// hexagons.push([1, 4, -5]);
	// hexagons.push([0, 5, -5]);
	// hexagons.push([-1, 5, -4]);
	// hexagons.push([-2, 5, -3]);
	hexagons.push([-3, 5, -2]);
	hexagons.push([-4, 5, -1]);
	hexagons.push([-5, 5, 0]);
	hexagons.push([-5, 4, 1]);
	hexagons.push([-5, 3, 2]);
	hexagons.push([-5, 2, 3]);
	hexagons.push([-5, 1, 4]);
	hexagons.push([-5, 0, 5]);
	hexagons.push([-4, -1, 5]);
	hexagons.push([-3, -2, 5]);
	// hexagons.push([-2, -3, 5]);
	// hexagons.push([-1, -4, 5]);
	// // The sixth layer
	// hexagons.push([0, -6, 6]);
	// hexagons.push([1, -6, 5]);
	// hexagons.push([2, -6, 4]);
	// hexagons.push([3, -6, 3]);
	// hexagons.push([4, -6, 2]);
	hexagons.push([5, -6, 1]);
	hexagons.push([6, -6, 0]);
	hexagons.push([6, -5, -1]);
	hexagons.push([6, -4, -2]);
	hexagons.push([6, -3, -2]);
	hexagons.push([6, -2, -4]);
	hexagons.push([6, -1, -5]);
	hexagons.push([6, 0, -6]);
	hexagons.push([5, 1, -6]);
	// hexagons.push([4, 2, -6]);
	// hexagons.push([3, 3, -6]);
	// hexagons.push([2, 4, -6]);
	// hexagons.push([1, 5, -6]);
	// hexagons.push([0, 6, -6]);
	// hexagons.push([-1, 6, -5]);
	// hexagons.push([-2, 6, -4]);
	// hexagons.push([-3, 6, -3]);
	// hexagons.push([-4, 6, -2]);
	hexagons.push([-5, 6, -1]);
	hexagons.push([-6, 6, 0]);
	hexagons.push([-6, 5, 1]);
	hexagons.push([-6, 4, 2]);
	hexagons.push([-6, 3, 3]);
	hexagons.push([-6, 2, 4]);
	hexagons.push([-6, 1, 5]);
	hexagons.push([-6, 0, 6]);
	hexagons.push([-5, -1, 6]);
	// hexagons.push([-4, -2, 6]);
	// hexagons.push([-3, -3, 6]);
	// hexagons.push([-2, -4, 6]);
	// hexagons.push([-1, -5, 6]);

</script>

{#each hexagons as hexagon, i}
	<!-- hexagon -->
	<Hexagon q={hexagon[0]} r={hexagon[1]} hexSize={hexSize} bind:this={hex[i]}></Hexagon>
{/each}

<main>
	<!-- Width is {screenWidth}px  Height is {screenHeight}px -->
	<div class="screen_box" bind:this={screenBox}></div>
</main>

<svelte:window on:wheel|nonpassive|preventDefault />

<style>

	main {
		font-family: sans-serif;
		text-align: center;

		overflow: auto;
		/* this will hide the scrollbar in mozilla based browsers */
		overflow: -moz-scrollbars-none;
		scrollbar-width: none;
		/* this will hide the scrollbar in internet explorers */
		-ms-overflow-style: none;
	}
	main::-webkit-scrollbar { 
		width: 0 !important;
		display: none;
	}

	/* the way we detect the screen size. 
	We create an element and make it be the full size of the screen 
	and we observe the width and height of this element. */
	:global(body) {
		margin: 0;
		padding: 0;
	}
	.screen_box {
		background-color: midnightblue;
		width: 100vw;
		height: 100vh;
	}
</style>