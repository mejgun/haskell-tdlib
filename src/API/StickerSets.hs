-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.StickerSets where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.StickerSetInfo as StickerSetInfo

--main = putStrLn "ok"

data StickerSets = 
 StickerSets { sets :: [StickerSetInfo.StickerSetInfo], total_count :: Int }  -- deriving (Show)

instance T.ToJSON StickerSets where
 toJSON (StickerSets { sets = sets, total_count = total_count }) =
  A.object [ "@type" A..= T.String "stickerSets", "sets" A..= sets, "total_count" A..= total_count ]
-- stickerSets StickerSets  { sets :: [StickerSetInfo.StickerSetInfo], total_count :: Int } 



instance T.FromJSON StickerSets where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "stickerSets" -> parseStickerSets v
  where
   parseStickerSets :: A.Value -> T.Parser StickerSets
   parseStickerSets = A.withObject "StickerSets" $ \o -> do
    sets <- o A..: "sets"
    total_count <- o A..: "total_count"
    return $ StickerSets { sets = sets, total_count = total_count }