#if UNITY_EDITOR

using System;
using System.Linq;
using UnityEditor;

namespace ETdoFresh.Actions
{
    public class GithubAction
    {
        public static void UnityBuild()
        {
            var scenes = EditorBuildSettings.scenes
                .Where(s => s.enabled)
                .Select(s => s.path)
                .ToArray();

            var targetPlatform = GetArgument("customBuildTarget");
            var locationPathName = GetArgument("customBuildPath");
            var buildName = GetArgument("customBuildName");

            var buildPlayerOptions = new BuildPlayerOptions
            {
                scenes = scenes,
                targetGroup = GetTargetGroup(targetPlatform),
                target = GetTarget(targetPlatform),
                locationPathName = GetPath(targetPlatform, locationPathName, buildName),
                options = BuildOptions.None,
            };
            BuildPipeline.BuildPlayer(buildPlayerOptions);
        }

        private static string GetArgument(string name)
        {
            string[] args = Environment.GetCommandLineArgs();

            for (int i = 0; i < args.Length; i++)
                if (args[i].Contains(name))
                    return args[i + 1];

            return null;
        }

        private static BuildTargetGroup GetTargetGroup(string targetPlatform)
        {
            if (targetPlatform.ToLower() == "windows") return BuildTargetGroup.Standalone;
            if (targetPlatform.ToLower() == "linux") return BuildTargetGroup.Standalone;
            if (targetPlatform.ToLower() == "osx") return BuildTargetGroup.Standalone;
            if (targetPlatform.ToLower() == "webgl") return BuildTargetGroup.WebGL;
            return BuildTargetGroup.Standalone;
        }

        private static BuildTarget GetTarget(string targetPlatform)
        {
            if (targetPlatform.ToLower() == "windows") return BuildTarget.StandaloneWindows64;
            if (targetPlatform.ToLower() == "linux") return BuildTarget.StandaloneLinux64;
            if (targetPlatform.ToLower() == "osx") return BuildTarget.StandaloneOSX;
            if (targetPlatform.ToLower() == "webgl") return BuildTarget.WebGL;
            return BuildTarget.StandaloneWindows64;
        }

        private static string GetPath(string targetPlatform, string locationPathName, string buildName)
        {
            if (locationPathName == null) locationPathName = "";
            if (locationPathName.EndsWith("/"))
                locationPathName = locationPathName.Substring(0, locationPathName.Length - 1);

            if (targetPlatform.ToLower() == "windows") return locationPathName + "/" + buildName + ".exe";
            if (targetPlatform.ToLower() == "android") return locationPathName + "/" + buildName + ".apk";
            if (targetPlatform.ToLower() == "webgl") return locationPathName;
            return locationPathName + "/" + buildName;
        }
    }
}
#endif
