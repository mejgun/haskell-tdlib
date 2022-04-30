-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CheckStickerSetName where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Checks whether a name can be used for a new sticker set 
-- 
-- __name__ Name to be checked
data CheckStickerSetName = 

 CheckStickerSetName { name :: Maybe String }  deriving (Eq)

instance Show CheckStickerSetName where
 show CheckStickerSetName { name=name } =
  "CheckStickerSetName" ++ U.cc [U.p "name" name ]

instance T.ToJSON CheckStickerSetName where
 toJSON CheckStickerSetName { name = name } =
  A.object [ "@type" A..= T.String "checkStickerSetName", "name" A..= name ]

instance T.FromJSON CheckStickerSetName where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "checkStickerSetName" -> parseCheckStickerSetName v
   _ -> mempty
  where
   parseCheckStickerSetName :: A.Value -> T.Parser CheckStickerSetName
   parseCheckStickerSetName = A.withObject "CheckStickerSetName" $ \o -> do
    name <- o A..:? "name"
    return $ CheckStickerSetName { name = name }
 parseJSON _ = mempty
