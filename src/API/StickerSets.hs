-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.StickerSets where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.StickerSetInfo as StickerSetInfo

data StickerSets = 
 StickerSets { sets :: Maybe [StickerSetInfo.StickerSetInfo], total_count :: Maybe Int }  deriving (Show)

instance T.ToJSON StickerSets where
 toJSON (StickerSets { sets = sets, total_count = total_count }) =
  A.object [ "@type" A..= T.String "stickerSets", "sets" A..= sets, "total_count" A..= total_count ]

instance T.FromJSON StickerSets where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "stickerSets" -> parseStickerSets v
   _ -> mempty
  where
   parseStickerSets :: A.Value -> T.Parser StickerSets
   parseStickerSets = A.withObject "StickerSets" $ \o -> do
    sets <- optional $ o A..: "sets"
    total_count <- optional $ o A..: "total_count"
    return $ StickerSets { sets = sets, total_count = total_count }