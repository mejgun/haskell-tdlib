-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ChangeStickerSet where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data ChangeStickerSet = 
 ChangeStickerSet { is_archived :: Maybe Bool, is_installed :: Maybe Bool, set_id :: Maybe Int }  deriving (Show)

instance T.ToJSON ChangeStickerSet where
 toJSON (ChangeStickerSet { is_archived = is_archived, is_installed = is_installed, set_id = set_id }) =
  A.object [ "@type" A..= T.String "changeStickerSet", "is_archived" A..= is_archived, "is_installed" A..= is_installed, "set_id" A..= set_id ]

instance T.FromJSON ChangeStickerSet where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "changeStickerSet" -> parseChangeStickerSet v
   _ -> mempty
  where
   parseChangeStickerSet :: A.Value -> T.Parser ChangeStickerSet
   parseChangeStickerSet = A.withObject "ChangeStickerSet" $ \o -> do
    is_archived <- optional $ o A..: "is_archived"
    is_installed <- optional $ o A..: "is_installed"
    set_id <- optional $ o A..: "set_id"
    return $ ChangeStickerSet { is_archived = is_archived, is_installed = is_installed, set_id = set_id }