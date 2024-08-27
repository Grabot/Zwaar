<script>
	import { onMount } from "svelte";
    import Hexagon from "./Hexagon.svelte";

	export let q;
	export let r;
	export let colourIntensity;
	export let hexSize;

	var ageOfGoldIntensity = colourIntensity;
	var hexTile;
	// var hexImage = "/images/brocast_transparent.png";
	var hexImage = "http://zwaar.dev/images/brocast_transparent.png";
	var hexTileText = "Age of Gold";

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
		window.location.href="https://brocast.nl";
	}

    function parentToggle() { }

	var hexagonData = {
		"hexSize": hexSize,
		"colourIntensity": ageOfGoldIntensity,
		"hexImage": hexImage,
		"hexTileText": hexTileText,
		"hexFontSize": hexSize/4
	};
</script>

<div class="hex_item" style='--pos_x:{pos_x};--pos_y:{pos_y};'>
    <Hexagon hexagonData={hexagonData} colourIntensity={ageOfGoldIntensity} hexSize={hexSize} hexImage={hexImage} hexTileText={"Age of Gold"} bind:this={hexTile} logoHex={false} toggle={parentToggle} onClick={handleClick}></Hexagon>
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
