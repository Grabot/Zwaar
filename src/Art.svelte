<script>
	import { onMount } from "svelte";

    const images = [
        {
            src: "/images/my_art/de_dans_IV.png",
            title: "De Dans III",
            description: "Inspired by the works of Henri Matisse, specifically La Danse II and the Nu bleu series. I liked how you can see the movement and the rhythm in the painting of La Danse II and the simplicity of the Nu bleu series, capturing everything in just using blue."
        },
        {
            src: "/images/my_art/gradient_art.png",
            title: "Gradient Art",
            description: "An abstract interpretation of an image. Here, a gradient algorithm is applied to an image which gives values for x and y on a grid basis. There is one value for red, green, and blue, and these are added to give a specific color. These values are painted on a canvas with the direction indicating where the gradient is going and the length indicating how strong the gradient was. (Small lines are omitted.)"
        },
        {
            src: "/images/my_art/mondriaan_in_time.png",
            title: "Mondriaan in Time",
            description: "A modern interpretation of Mondriaan's style. Where Mondriaan's famous \"De Stijl\" style has strict 90-degree angles and primary colors, this painting is a representation of that style years later. Now each angle is exactly not 90 degrees, but 88, 89, 91, or 92. Also, the colors have faded into a tertiary color palette instead of the primary colors."
        },
        {
            src: "/images/my_art/mondriaan_in_time_anna.png",
            title: "Mondriaan in Time Anna",
            description: "The new \"Stijl\" style is transformed into an algorithm which can represent a new art piece for any person. Here is an example of a personalization for Anna. Here I no longer use tertiary colours but a nice colour pallette which I think represents the person."
        },
        {
            src: "/images/my_art/rough_water.png",
            title: "Rough Water",
            description: "A painting of rough water with nice vibrant colors. One of the first paintings I made. I was inspired by an art piece that I saw on Reddit and wanted to make something similar. I like how it came out and it showed me that you don't need to know how to paint to paint."
        },
        {
            src: "/images/my_art/stilleven.png",
            title: "Stilleven",
            description: "A classic still life painting. I was playing around with paintings where details are omitted. In this case, I used a large brush with way too much paint on it to create thick paint blobs. This created a sort of mosaic effect where the paint of the painting sticks out and gives it an almost 3D effect."
        },
        {
            src: "/images/my_art/titiana.png",
            title: "Titiana",
            description: "A painting of a nude sent by Titiana. The painting shows more of the emotion that the nude brought than the details of the nude itself. The beautiful shapes with the vibrant colors put a smile on my face every time I look at it."
        },
        {
            src: "/images/my_art/utrecht_gracht.png",
            title: "Utrecht Gracht",
            description: "A scenic view of Utrecht's Nieuwe Gracht. A collaborative art project with Jos. He took photos around Utrecht and captured the beauty and the essence of the city. He would convert these photos with art styles of famous artists. I took a specific liking to this photo of the Utrecht Nieuwe Gracht and I decided to paint it. This is my largest canvas to date with a size of 100cm x 80cm."
        },
        {
            src: "/images/my_art/voronoi_art.png",
            title: "Voronoi Art",
            description: "Almost all of my art pieces have an underlying mathematical algorithm to them. Often times, I find the visualization of these algorithms to have a certain beauty which I can only describe as art. This is another example where I was mesmerized by the visualization of the Voronoi algorithm. A graph representation which partitions a plane into regions close to each of the nodes in the graph. When each region is given the average color of the plane region, you get a beautiful mosaic-like tessellation. Again, this would be omitting detail from the image used and I took an image where this would be a nice effect. If it's not clear what the image represents, I would look at it from a large distance."
        },
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
    <br>
    <br>
    <br>
    <h2 class="centered_text">Gallery</h2>
    <p class="page_description">
        Welcome to Zwaar Developers gallery! <br>
        Here you will find a collection of unique and captivating art pieces created by a talented artist, me!<br>
        Each piece tells a story and showcases the artist's unique style and vision. Feel free to explore and enjoy the beauty of these artworks.<br>
    </p>
    <div class="image_container">
        {#each images as art, index}
            <div class="art_item">
                <h2 class="art_title">{art.title}</h2>
                <button type="button" class="art_button" on:click={() => toggleFullScreen(index)}>
                    <img
                        class="art_image {fullScreenIndex === index ? 'fullscreen' : ''}"
                        style='--image_width:{image_width};'
                        src={art.src}
                        alt="art_{index}"
                    />
                </button>
                <p class="art_description">{art.description}</p>
            </div>
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
        max-width: 800px;
    }
    .image_container {
        display: flex;
        flex-direction: column;
        align-items: center;
    }
    .art_item {
        text-align: center;
        margin-bottom: 20px;
        max-width: 800px;
        margin-left: auto;
        margin-right: auto;
    }
    .art_title {
        font-size: 24px;
        margin-bottom: 10px;
    }
    .art_button {
        background: none;
        border: none;
        padding: 0;
        cursor: pointer;
        display: block;
    }
    .art_image {
        padding-top: 30px;
        height: auto;
        width: calc( var(--image_width) * 1px );
        max-width: 800px;
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
    .art_description {
        font-size: 16px;
        color: grey;
        margin-top: 10px;
        max-width: 800px;
    }
    .page_description {
        text-align: center;
        font-size: 18px;
        margin-bottom: 20px;
        padding: 0 20px;
    }
    .art_content {
        padding-bottom: 400px;
    }
</style>
