-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ToggleGroupCallIsMyVideoEnabled where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Toggles whether current user's video is enabled 
-- 
-- __group_call_id__ Group call identifier
-- 
-- __is_my_video_enabled__ Pass true if the current user's video is enabled
data ToggleGroupCallIsMyVideoEnabled = 

 ToggleGroupCallIsMyVideoEnabled { is_my_video_enabled :: Maybe Bool, group_call_id :: Maybe Int }  deriving (Eq)

instance Show ToggleGroupCallIsMyVideoEnabled where
 show ToggleGroupCallIsMyVideoEnabled { is_my_video_enabled=is_my_video_enabled, group_call_id=group_call_id } =
  "ToggleGroupCallIsMyVideoEnabled" ++ cc [p "is_my_video_enabled" is_my_video_enabled, p "group_call_id" group_call_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON ToggleGroupCallIsMyVideoEnabled where
 toJSON ToggleGroupCallIsMyVideoEnabled { is_my_video_enabled = is_my_video_enabled, group_call_id = group_call_id } =
  A.object [ "@type" A..= T.String "toggleGroupCallIsMyVideoEnabled", "is_my_video_enabled" A..= is_my_video_enabled, "group_call_id" A..= group_call_id ]

instance T.FromJSON ToggleGroupCallIsMyVideoEnabled where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "toggleGroupCallIsMyVideoEnabled" -> parseToggleGroupCallIsMyVideoEnabled v
   _ -> mempty
  where
   parseToggleGroupCallIsMyVideoEnabled :: A.Value -> T.Parser ToggleGroupCallIsMyVideoEnabled
   parseToggleGroupCallIsMyVideoEnabled = A.withObject "ToggleGroupCallIsMyVideoEnabled" $ \o -> do
    is_my_video_enabled <- o A..:? "is_my_video_enabled"
    group_call_id <- mconcat [ o A..:? "group_call_id", readMaybe <$> (o A..: "group_call_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ToggleGroupCallIsMyVideoEnabled { is_my_video_enabled = is_my_video_enabled, group_call_id = group_call_id }
 parseJSON _ = mempty
