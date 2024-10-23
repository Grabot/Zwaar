<script>
	import { onMount } from "svelte";
    import Hexagon from "./Hexagon.svelte";

	export let q;
	export let r;
	export let colourIntensity;
	export let hexSize;

	var contactIntensity = colourIntensity;
	var hexTile;
	var hexImage = "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";
	var hexTileText = "Contact";

	// Size of the hexagon and the internal dimensions of the svg viewBox. 
	let xSize = 2 * hexSize;
	let ySize = Math.sqrt(3) * hexSize;

	function setHexagonDetails() {
		// Size of the hexagon and the internal dimensions of the svg viewBox. 
		xSize = 2 * hexSize;
		ySize = Math.sqrt(3) * hexSize;
	}

	let pos_x = 0;
	let pos_y = 0;
	function getTilePos() {
		pos_x = xSize * 3 / 4 * q;
		const yTr1 = ySize / 2 * q;
		const yTr2 = ySize * r;
		pos_y = yTr1 + yTr2;
	}
	setHexagonDetails();
	getTilePos();

	export const updateHexagon = function(hexagonSize) {
		hexSize = hexagonSize;
		hexTile.updateHexagon(hexagonSize);
		setHexagonDetails();
		getTilePos();
    }

	onMount(() => {});

	function handleClick(e) {
		window.location.href="/contact";
	}

    function parentToggle() { }

	// data of the tile which will not change during runtime
	var hexagonData = {
		"hexImage": hexImage,
		"hexTileText": hexTileText,
		"logoHex": false,
		"hexFontSizeRatio": 3.8  // the font size is based on the tile size and some ratio that's defined here.
	};
</script>

<div class="hex_item" style='--pos_x:{pos_x};--pos_y:{pos_y};'>
    <Hexagon hexagonData={hexagonData} colourIntensity={colourIntensity} hexSize={hexSize} bind:this={hexTile} toggle={parentToggle} onClick={handleClick}></Hexagon>
</div>

<style>
	.hex_item {
		pointer-events: None;
		position: absolute;
		top: 50%;
		left: 50%;
		transform: 
			translate(
				-50%,
				-50%
				)
			translate(
				calc( var(--pos_x) * 1px ),
				calc( var(--pos_y) * 1px )
				);
	}

</style>
