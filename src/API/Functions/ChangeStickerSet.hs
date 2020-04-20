-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ChangeStickerSet where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data ChangeStickerSet = 
 ChangeStickerSet { is_archived :: Bool, is_installed :: Bool, set_id :: Int }  -- deriving (Show)

instance T.ToJSON ChangeStickerSet where
 toJSON (ChangeStickerSet { is_archived = is_archived, is_installed = is_installed, set_id = set_id }) =
  A.object [ "@type" A..= T.String "changeStickerSet", "is_archived" A..= is_archived, "is_installed" A..= is_installed, "set_id" A..= set_id ]
-- changeStickerSet ChangeStickerSet  { is_archived :: Bool, is_installed :: Bool, set_id :: Int } 



instance T.FromJSON ChangeStickerSet where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "changeStickerSet" -> parseChangeStickerSet v
  where
   parseChangeStickerSet :: A.Value -> T.Parser ChangeStickerSet
   parseChangeStickerSet = A.withObject "ChangeStickerSet" $ \o -> do
    is_archived <- o A..: "is_archived"
    is_installed <- o A..: "is_installed"
    set_id <- o A..: "set_id"
    return $ ChangeStickerSet { is_archived = is_archived, is_installed = is_installed, set_id = set_id }