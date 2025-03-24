<script>
	import { onMount } from "svelte";

    const images = [
        "/images/founder.png",
        "/images/CTO.png",
        "/images/CEO.png",
        "/images/CFO.png",
        "/images/co_founder.png",
        "/images/CTO.png",
        "/images/founder.png",
        "/images/HumanResources.png",
        "/images/import_export.png",
        "/images/art_manager.png",
        "/images/SocialMediaManager.png",
        "/images/Zwaar_Logo.png"
    ];

    let logoImage = "/images/Zwaar_Logo.png";
    let screenBox;
	let screenWidth = -1;
    let innerWidth = 0;
    let innerHeight = 0;
    $: normalMode = innerWidth * 1.33 >= innerHeight;

    let image_width = screenWidth;
    let fullScreenIndex = -1;

    onMount(() => {
		const resizeObserver = new ResizeObserver(entries => {
			const entry = entries.at(0);
			screenWidth = entry.contentRect.width;
            image_width = screenWidth;
		});
		resizeObserver.observe(screenBox);
		return () => resizeObserver.unobserve(screenBox);
	});

    function toggleFullScreen(index) {
        fullScreenIndex = (fullScreenIndex === index) ? -1 : index;
    }

    function navigateHome() {
        window.location.href = "/";
    }
</script>

<div class="screen_box" bind:this={screenBox}></div>

<div class="art_content">
    <div class="container">
        <a href="/" on:click={navigateHome}>
            <img class="container_image" style='--image_width:{image_width};' src={logoImage} alt="logo" />
        </a>
    </div>
    <h1 class="centered_text" id="developers_text" style='--image_width:{image_width};'><strong><b>Developers</b></strong></h1>
    <div class="image_container">
        {#each images as art, index}
            <button type="button" class="art_button" on:click={() => toggleFullScreen(index)}>
                <img
                    class="art_image {fullScreenIndex === index ? 'fullscreen' : ''}"
                    style='--image_width:{image_width};'
                    src={art}
                    alt="art_{index}"
                />
            </button>
        {/each}
    </div>
</div>

<svelte:window bind:innerWidth bind:innerHeight />

<style>
    #developers_text {
        padding-left: clamp(0px, calc( var(--image_width) * 0.1px ), 60px);
        color: grey;
        font-size: clamp(0px, calc( var(--image_width) * 0.07px ), 42px);
        font-size: 40px;
    }
    .centered_text {
        text-align: center;
        padding: 0px;
        margin: 0px;
    }
    .container {
      text-align: center;
      margin-top: 20px;
    }
    .container_image {
        height: auto;
        width: calc( var(--image_width) * 1px );
        max-width: 600px;
    }
    .image_container {
        display: flex;
        flex-direction: column;
        align-items: center;
    }
    .art_button {
        background: none;
        border: none;
        padding: 0;
        cursor: pointer;
        display: block;
        margin-bottom: 20px;
    }
    .art_image {
        padding-top: 30px;
        height: auto;
        width: calc( var(--image_width) * 1px );
        max-width: 600px;
        /* transition: transform 0.3s ease, z-index 0.3s ease; */
    }
    .art_image.fullscreen {
        position: fixed;
        top: 50%;
        left: 50%;
        width: 100vw;
        height: 100vh;
        max-width: none;
        object-fit: contain;
        z-index: 1000;
        background-color: rgba(0, 0, 0, 0.8);
        transform: translate(-50%, -50%);
        padding: 50px;
        box-sizing: border-box;
    }
</style>
