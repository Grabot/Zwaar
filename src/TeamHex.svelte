<script>
	import { onMount } from "svelte";
    import Hexagon from "./Hexagon.svelte";

	export let q;
	export let r;
	export let colourIntensity;
	export let hexSize;

	var teamIntensity = colourIntensity;
	var hexTile;
	var hexImage = "http://zwaar.dev/images/brocast_transparent.png";
	var hexTileText = "Team";

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
		window.location.href="/team";
	}

    function parentToggle() { }

	// data of the tile which will not change during runtime
	var hexagonData = {
		"hexImage": hexImage,
		"hexTileText": hexTileText,
		"logoHex": false,
		"hexFontSizeRatio": 2.8  // the font size is based on the tile size and some ratio that's defined here.
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
