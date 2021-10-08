-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ToggleGroupCallIsMyVideoPaused where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Toggles whether current user's video is paused 
-- 
-- __group_call_id__ Group call identifier
-- 
-- __is_my_video_paused__ Pass true if the current user's video is paused
data ToggleGroupCallIsMyVideoPaused = 

 ToggleGroupCallIsMyVideoPaused { is_my_video_paused :: Maybe Bool, group_call_id :: Maybe Int }  deriving (Eq)

instance Show ToggleGroupCallIsMyVideoPaused where
 show ToggleGroupCallIsMyVideoPaused { is_my_video_paused=is_my_video_paused, group_call_id=group_call_id } =
  "ToggleGroupCallIsMyVideoPaused" ++ cc [p "is_my_video_paused" is_my_video_paused, p "group_call_id" group_call_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON ToggleGroupCallIsMyVideoPaused where
 toJSON ToggleGroupCallIsMyVideoPaused { is_my_video_paused = is_my_video_paused, group_call_id = group_call_id } =
  A.object [ "@type" A..= T.String "toggleGroupCallIsMyVideoPaused", "is_my_video_paused" A..= is_my_video_paused, "group_call_id" A..= group_call_id ]

instance T.FromJSON ToggleGroupCallIsMyVideoPaused where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "toggleGroupCallIsMyVideoPaused" -> parseToggleGroupCallIsMyVideoPaused v
   _ -> mempty
  where
   parseToggleGroupCallIsMyVideoPaused :: A.Value -> T.Parser ToggleGroupCallIsMyVideoPaused
   parseToggleGroupCallIsMyVideoPaused = A.withObject "ToggleGroupCallIsMyVideoPaused" $ \o -> do
    is_my_video_paused <- o A..:? "is_my_video_paused"
    group_call_id <- mconcat [ o A..:? "group_call_id", readMaybe <$> (o A..: "group_call_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ToggleGroupCallIsMyVideoPaused { is_my_video_paused = is_my_video_paused, group_call_id = group_call_id }
 parseJSON _ = mempty
