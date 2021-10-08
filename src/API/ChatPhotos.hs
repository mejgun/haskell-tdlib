-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatPhotos where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.ChatPhoto as ChatPhoto

-- |
-- 
-- Contains a list of chat or user profile photos 
-- 
-- __total_count__ Total number of photos
-- 
-- __photos__ List of photos
data ChatPhotos = 

 ChatPhotos { photos :: Maybe [ChatPhoto.ChatPhoto], total_count :: Maybe Int }  deriving (Eq)

instance Show ChatPhotos where
 show ChatPhotos { photos=photos, total_count=total_count } =
  "ChatPhotos" ++ cc [p "photos" photos, p "total_count" total_count ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON ChatPhotos where
 toJSON ChatPhotos { photos = photos, total_count = total_count } =
  A.object [ "@type" A..= T.String "chatPhotos", "photos" A..= photos, "total_count" A..= total_count ]

instance T.FromJSON ChatPhotos where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "chatPhotos" -> parseChatPhotos v
   _ -> mempty
  where
   parseChatPhotos :: A.Value -> T.Parser ChatPhotos
   parseChatPhotos = A.withObject "ChatPhotos" $ \o -> do
    photos <- o A..:? "photos"
    total_count <- mconcat [ o A..:? "total_count", readMaybe <$> (o A..: "total_count" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ChatPhotos { photos = photos, total_count = total_count }
 parseJSON _ = mempty
