-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.GroupCallVideoQuality where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Describes the quality of a group call video
data GroupCallVideoQuality = 
 -- |
 -- 
 -- The worst available video quality
 GroupCallVideoQualityThumbnail |
 -- |
 -- 
 -- The medium video quality
 GroupCallVideoQualityMedium |
 -- |
 -- 
 -- The best available video quality
 GroupCallVideoQualityFull deriving (Eq)

instance Show GroupCallVideoQuality where
 show GroupCallVideoQualityThumbnail {  } =
  "GroupCallVideoQualityThumbnail" ++ cc [ ]

 show GroupCallVideoQualityMedium {  } =
  "GroupCallVideoQualityMedium" ++ cc [ ]

 show GroupCallVideoQualityFull {  } =
  "GroupCallVideoQualityFull" ++ cc [ ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GroupCallVideoQuality where
 toJSON GroupCallVideoQualityThumbnail {  } =
  A.object [ "@type" A..= T.String "groupCallVideoQualityThumbnail" ]

 toJSON GroupCallVideoQualityMedium {  } =
  A.object [ "@type" A..= T.String "groupCallVideoQualityMedium" ]

 toJSON GroupCallVideoQualityFull {  } =
  A.object [ "@type" A..= T.String "groupCallVideoQualityFull" ]

instance T.FromJSON GroupCallVideoQuality where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "groupCallVideoQualityThumbnail" -> parseGroupCallVideoQualityThumbnail v
   "groupCallVideoQualityMedium" -> parseGroupCallVideoQualityMedium v
   "groupCallVideoQualityFull" -> parseGroupCallVideoQualityFull v
   _ -> mempty
  where
   parseGroupCallVideoQualityThumbnail :: A.Value -> T.Parser GroupCallVideoQuality
   parseGroupCallVideoQualityThumbnail = A.withObject "GroupCallVideoQualityThumbnail" $ \o -> do
    return $ GroupCallVideoQualityThumbnail {  }

   parseGroupCallVideoQualityMedium :: A.Value -> T.Parser GroupCallVideoQuality
   parseGroupCallVideoQualityMedium = A.withObject "GroupCallVideoQualityMedium" $ \o -> do
    return $ GroupCallVideoQualityMedium {  }

   parseGroupCallVideoQualityFull :: A.Value -> T.Parser GroupCallVideoQuality
   parseGroupCallVideoQualityFull = A.withObject "GroupCallVideoQualityFull" $ \o -> do
    return $ GroupCallVideoQualityFull {  }
 parseJSON _ = mempty
