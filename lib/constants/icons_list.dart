import "package:flutter/widgets.dart";
import "package:flutter_feather_icons/flutter_feather_icons.dart";

List<IconData> iconDataList = [
  FeatherIcons.activity,
  FeatherIcons.airplay,
  FeatherIcons.alertCircle,
  FeatherIcons.alertOctagon,
  FeatherIcons.alertTriangle,
  FeatherIcons.alignCenter,
  FeatherIcons.alignJustify,
  FeatherIcons.alignLeft,
  FeatherIcons.alignRight,
  // FeatherIcons.anchor,
  // FeatherIcons.aperture,
  // FeatherIcons.archive,
  // FeatherIcons.arrowDownCircle,
  // FeatherIcons.arrowDownLeft,
  // FeatherIcons.arrowDownRight,
  // FeatherIcons.arrowDown,
  // FeatherIcons.arrowLeftCircle,
  // FeatherIcons.arrowLeft,
  // FeatherIcons.arrowRightCircle,
  // FeatherIcons.arrowRight,
  // FeatherIcons.arrowUpCircle,
  // FeatherIcons.arrowUpLeft,
  // FeatherIcons.arrowUpRight,
  // FeatherIcons.arrowUp,
  // FeatherIcons.atSign,
  // FeatherIcons.award,
  // FeatherIcons.barChart2,
  // FeatherIcons.barChart,
  // FeatherIcons.batteryCharging,
  // FeatherIcons.battery,
  // FeatherIcons.bellOff,
  // FeatherIcons.bell,
  // FeatherIcons.bluetooth,
  // FeatherIcons.bold,
  // FeatherIcons.bookOpen,
  // FeatherIcons.book,
  // FeatherIcons.bookmark,
  // FeatherIcons.box,
  // FeatherIcons.briefcase,
  // FeatherIcons.calendar,
  // FeatherIcons.cameraOff,
  // FeatherIcons.camera,
  // FeatherIcons.cast,
  // FeatherIcons.checkCircle,
  // FeatherIcons.checkSquare,
  // FeatherIcons.check,
  // FeatherIcons.chevronDown,
  // FeatherIcons.chevronLeft,
  // FeatherIcons.chevronRight,
  // FeatherIcons.chevronUp,
  // FeatherIcons.chevronsDown,
  // FeatherIcons.chevronsLeft,
  // FeatherIcons.chevronsRight,
  // FeatherIcons.chevronsUp,
  // FeatherIcons.chrome,
  // FeatherIcons.circle,
  // FeatherIcons.clipboard,
  // FeatherIcons.clock,
  // FeatherIcons.cloudDrizzle,
  // FeatherIcons.cloudLightning,
  // FeatherIcons.cloudOff,
  // FeatherIcons.cloudRain,
  // FeatherIcons.cloudSnow,
  // FeatherIcons.cloud,
  // FeatherIcons.code,
  // FeatherIcons.codepen,
  // FeatherIcons.codesandbox,
  // FeatherIcons.coffee,
  // FeatherIcons.columns,
  // FeatherIcons.command,
  // FeatherIcons.compass,
  // FeatherIcons.copy,
  // FeatherIcons.cornerDownLeft,
  // FeatherIcons.cornerDownRight,
  // FeatherIcons.cornerLeftDown,
  // FeatherIcons.cornerLeftUp,
  // FeatherIcons.cornerRightDown,
  // FeatherIcons.cornerRightUp,
  // FeatherIcons.cornerUpLeft,
  // FeatherIcons.cornerUpRight,
  // FeatherIcons.cpu,
  // FeatherIcons.creditCard,
  // FeatherIcons.crop,
  // FeatherIcons.crosshair,
  // FeatherIcons.database,
  // FeatherIcons.delete,
  // FeatherIcons.disc,
  // FeatherIcons.dollarSign,
  // FeatherIcons.downloadCloud,
  // FeatherIcons.download,
  // FeatherIcons.droplet,
  // FeatherIcons.edit2,
  // FeatherIcons.edit3,
  // FeatherIcons.edit,
  // FeatherIcons.externalLink,
  // FeatherIcons.eyeOff,
  // FeatherIcons.eye,
  // FeatherIcons.facebook,
  // FeatherIcons.fastForward,
  // FeatherIcons.feather,
  // FeatherIcons.figma,
  // FeatherIcons.fileMinus,
  // FeatherIcons.filePlus,
  // FeatherIcons.fileText,
  // FeatherIcons.file,
  // FeatherIcons.film,
  // FeatherIcons.filter,
  // FeatherIcons.flag,
  // FeatherIcons.folderMinus,
  // FeatherIcons.folderPlus,
  // FeatherIcons.folder,
  // FeatherIcons.framer,
  // FeatherIcons.frown,
  // FeatherIcons.gift,
  // FeatherIcons.gitBranch,
  // FeatherIcons.gitCommit,
  // FeatherIcons.gitMerge,
  // FeatherIcons.gitPullRequest,
  // FeatherIcons.github,
  // FeatherIcons.gitlab,
  // FeatherIcons.globe,
  // FeatherIcons.grid,
  // FeatherIcons.hardDrive,
  // FeatherIcons.hash,
  // FeatherIcons.headphones,
  // FeatherIcons.heart,
  // FeatherIcons.helpCircle,
  // FeatherIcons.hexagon,
  // FeatherIcons.home,
  // FeatherIcons.image,
  // FeatherIcons.inbox,
  // FeatherIcons.info,
  // FeatherIcons.instagram,
  // FeatherIcons.italic,
  // FeatherIcons.key,
  // FeatherIcons.layers,
  // FeatherIcons.layout,
  // FeatherIcons.lifeBuoy,
  // FeatherIcons.link2,
  // FeatherIcons.link,
  // FeatherIcons.linkedin,
  // FeatherIcons.list,
  // FeatherIcons.loader,
  // FeatherIcons.lock,
  // FeatherIcons.logIn,
  // FeatherIcons.logOut,
  // FeatherIcons.mail,
  // FeatherIcons.mapPin,
  // FeatherIcons.map,
  // FeatherIcons.maximize2,
  // FeatherIcons.maximize,
  // FeatherIcons.meh,
  // FeatherIcons.menu,
  // FeatherIcons.messageCircle,
  // FeatherIcons.messageSquare,
  // FeatherIcons.micOff,
  // FeatherIcons.mic,
  // FeatherIcons.minimize2,
  // FeatherIcons.minimize,
  // FeatherIcons.minusCircle,
  // FeatherIcons.minusSquare,
  // FeatherIcons.minus,
  // FeatherIcons.monitor,
  // FeatherIcons.moon,
  // FeatherIcons.moreHorizontal,
  // FeatherIcons.moreVertical,
  // FeatherIcons.mousePointer,
  // FeatherIcons.move,
  // FeatherIcons.music,
  // FeatherIcons.navigation2,
  // FeatherIcons.navigation,
  // FeatherIcons.octagon,
  // FeatherIcons.package,
  // FeatherIcons.paperclip,
  // FeatherIcons.pauseCircle,
  // FeatherIcons.pause,
  // FeatherIcons.penTool,
  // FeatherIcons.percent,
  // FeatherIcons.phoneCall,
  // FeatherIcons.phoneForwarded,
  // FeatherIcons.phoneIncoming,
  // FeatherIcons.phoneMissed,
  // FeatherIcons.phoneOff,
  // FeatherIcons.phoneOutgoing,
  // FeatherIcons.phone,
  // FeatherIcons.pieChart,
  // FeatherIcons.playCircle,
  // FeatherIcons.play,
  // FeatherIcons.plusCircle,
  // FeatherIcons.plusSquare,
  // FeatherIcons.plus,
  // FeatherIcons.pocket,
  // FeatherIcons.power,
  // FeatherIcons.printer,
  // FeatherIcons.radio,
  // FeatherIcons.refreshCcw,
  // FeatherIcons.refreshCw,
  // FeatherIcons.repeat,
  // FeatherIcons.rewind,
  // FeatherIcons.rotateCcw,
  // FeatherIcons.rotateCw,
  // FeatherIcons.rss,
  // FeatherIcons.save,
  // FeatherIcons.scissors,
  // FeatherIcons.search,
  // FeatherIcons.send,
  // FeatherIcons.server,
  // FeatherIcons.settings,
  // FeatherIcons.share2,
  // FeatherIcons.share,
  // FeatherIcons.shieldOff,
  // FeatherIcons.shield,
  // FeatherIcons.shoppingBag,
  // FeatherIcons.shoppingCart,
  // FeatherIcons.shuffle,
  // FeatherIcons.sidebar,
  // FeatherIcons.skipBack,
  // FeatherIcons.skipForward,
  // FeatherIcons.slack,
  // FeatherIcons.slash,
  // FeatherIcons.sliders,
  // FeatherIcons.smartphone,
  // FeatherIcons.smile,
  // FeatherIcons.speaker,
  // FeatherIcons.square,
  // FeatherIcons.star,
  // FeatherIcons.stopCircle,
  // FeatherIcons.sun,
  // FeatherIcons.sunrise,
  // FeatherIcons.sunset,
  // FeatherIcons.tablet,
  // FeatherIcons.tag,
  // FeatherIcons.target,
  // FeatherIcons.terminal,
  // FeatherIcons.thermometer,
  // FeatherIcons.thumbsDown,
  // FeatherIcons.thumbsUp,
  // FeatherIcons.toggleLeft,
  // FeatherIcons.toggleRight,
  // FeatherIcons.trash2,
  // FeatherIcons.trash,
  // FeatherIcons.trello,
  // FeatherIcons.trendingDown,
  // FeatherIcons.trendingUp,
  // FeatherIcons.triangle,
  // FeatherIcons.truck,
  // FeatherIcons.tv,
  // FeatherIcons.twitter,
  // FeatherIcons.type,
  // FeatherIcons.umbrella,
  // FeatherIcons.underline,
  // FeatherIcons.unlock,
  // FeatherIcons.uploadCloud,
  // FeatherIcons.upload,
  // FeatherIcons.userCheck,
  // FeatherIcons.userMinus,
  // FeatherIcons.userPlus,
  // FeatherIcons.userX,
  // FeatherIcons.user,
  // FeatherIcons.users,
  // FeatherIcons.videoOff,
  // FeatherIcons.video,
  // FeatherIcons.voicemail,
  // FeatherIcons.volume1,
  // FeatherIcons.volume2,
  // FeatherIcons.volumeX,
  // FeatherIcons.volume,
  // FeatherIcons.watch,
  // FeatherIcons.wifiOff,
  // FeatherIcons.wifi,
  // FeatherIcons.wind,
  // FeatherIcons.xCircle,
  // FeatherIcons.xOctagon,
  // FeatherIcons.xSquare,
  // FeatherIcons.x,
  // FeatherIcons.youtube,
  // FeatherIcons.zapOff,
  // FeatherIcons.zap,
  // FeatherIcons.zoomIn,
  // FeatherIcons.zoomOut
];

List<String> iconNameList = [
  "activity",
  "airplay",
  "alertCircle",
  "alertOctagon",
  "alertTriangle",
  "alignCenter",
  "alignJustify",
  "alignLeft",
  "alignRight",
  // "anchor",
  // "aperture",
  // "archive",
  // "arrowDownCircle",
  // "arrowDownLeft",
  // "arrowDownRight",
  // "arrowDown",
  // "arrowLeftCircle",
  // "arrowLeft",
  // "arrowRightCircle",
  // "arrowRight",
  // "arrowUpCircle",
  // "arrowUpLeft",
  // "arrowUpRight",
  // "arrowUp",
  // "atSign",
  // "award",
  // "barChart2",
  // "barChart",
  // "batteryCharging",
  // "battery",
  // "bellOff",
  // "bell",
  // "bluetooth",
  // "bold",
  // "bookOpen",
  // "book",
  // "bookmark",
  // "box",
  // "briefcase",
  // "calendar",
  // "cameraOff",
  // "camera",
  // "cast",
  // "checkCircle",
  // "checkSquare",
  // "check",
  // "chevronDown",
  // "chevronLeft",
  // "chevronRight",
  // "chevronUp",
  // "chevronsDown",
  // "chevronsLeft",
  // "chevronsRight",
  // "chevronsUp",
  // "chrome",
  // "circle",
  // "clipboard",
  // "clock",
  // "cloudDrizzle",
  // "cloudLightning",
  // "cloudOff",
  // "cloudRain",
  // "cloudSnow",
  // "cloud",
  // "code",
  // "codepen",
  // "codesandbox",
  // "coffee",
  // "columns",
  // "command",
  // "compass",
  // "copy",
  // "cornerDownLeft",
  // "cornerDownRight",
  // "cornerLeftDown",
  // "cornerLeftUp",
  // "cornerRightDown",
  // "cornerRightUp",
  // "cornerUpLeft",
  // "cornerUpRight",
  // "cpu",
  // "creditCard",
  // "crop",
  // "crosshair",
  // "database",
  // "delete",
  // "disc",
  // "dollarSign",
  // "downloadCloud",
  // "download",
  // "droplet",
  // "edit2",
  // "edit3",
  // "edit",
  // "externalLink",
  // "eyeOff",
  // "eye",
  // "facebook",
  // "fastForward",
  // "feather",
  // "figma",
  // "fileMinus",
  // "filePlus",
  // "fileText",
  // "file",
  // "film",
  // "filter",
  // "flag",
  // "folderMinus",
  // "folderPlus",
  // "folder",
  // "framer",
  // "frown",
  // "gift",
  // "gitBranch",
  // "gitCommit",
  // "gitMerge",
  // "gitPullRequest",
  // "github",
  // "gitlab",
  // "globe",
  // "grid",
  // "hardDrive",
  // "hash",
  // "headphones",
  // "heart",
  // "helpCircle",
  // "hexagon",
  // "home",
  // "image",
  // "inbox",
  // "info",
  // "instagram",
  // "italic",
  // "key",
  // "layers",
  // "layout",
  // "lifeBuoy",
  // "link2",
  // "link",
  // "linkedin",
  // "list",
  // "loader",
  // "lock",
  // "logIn",
  // "logOut",
  // "mail",
  // "mapPin",
  // "map",
  // "maximize2",
  // "maximize",
  // "meh",
  // "menu",
  // "messageCircle",
  // "messageSquare",
  // "micOff",
  // "mic",
  // "minimize2",
  // "minimize",
  // "minusCircle",
  // "minusSquare",
  // "minus",
  // "monitor",
  // "moon",
  // "moreHorizontal",
  // "moreVertical",
  // "mousePointer",
  // "move",
  // "music",
  // "navigation2",
  // "navigation",
  // "octagon",
  // "package",
  // "paperclip",
  // "pauseCircle",
  // "pause",
  // "penTool",
  // "percent",
  // "phoneCall",
  // "phoneForwarded",
  // "phoneIncoming",
  // "phoneMissed",
  // "phoneOff",
  // "phoneOutgoing",
  // "phone",
  // "pieChart",
  // "playCircle",
  // "play",
  // "plusCircle",
  // "plusSquare",
  // "plus",
  // "pocket",
  // "power",
  // "printer",
  // "radio",
  // "refreshCcw",
  // "refreshCw",
  // "repeat",
  // "rewind",
  // "rotateCcw",
  // "rotateCw",
  // "rss",
  // "save",
  // "scissors",
  // "search",
  // "send",
  // "server",
  // "settings",
  // "share2",
  // "share",
  // "shieldOff",
  // "shield",
  // "shoppingBag",
  // "shoppingCart",
  // "shuffle",
  // "sidebar",
  // "skipBack",
  // "skipForward",
  // "slack",
  // "slash",
  // "sliders",
  // "smartphone",
  // "smile",
  // "speaker",
  // "square",
  // "star",
  // "stopCircle",
  // "sun",
  // "sunrise",
  // "sunset",
  // "tablet",
  // "tag",
  // "target",
  // "terminal",
  // "thermometer",
  // "thumbsDown",
  // "thumbsUp",
  // "toggleLeft",
  // "toggleRight",
  // "trash2",
  // "trash",
  // "trello",
  // "trendingDown",
  // "trendingUp",
  // "triangle",
  // "truck",
  // "tv",
  // "twitter",
  // "type",
  // "umbrella",
  // "underline",
  // "unlock",
  // "uploadCloud",
  // "upload",
  // "userCheck",
  // "userMinus",
  // "userPlus",
  // "userX",
  // "user",
  // "users",
  // "videoOff",
  // "video",
  // "voicemail",
  // "volume1",
  // "volume2",
  // "volumeX",
  // "volume",
  // "watch",
  // "wifiOff",
  // "wifi",
  // "wind",
  // "xCircle",
  // "xOctagon",
  // "xSquare",
  // "x",
  // "youtube",
  // "zapOff",
  // "zap",
  // "zoomIn",
  // "zoomOut"
];