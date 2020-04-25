-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.EncryptedPassportElement where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.DatedFile as DatedFile
import {-# SOURCE #-} qualified API.PassportElementType as PassportElementType

data EncryptedPassportElement = 
 EncryptedPassportElement { hash :: Maybe String, value :: Maybe String, files :: Maybe [DatedFile.DatedFile], translation :: Maybe [DatedFile.DatedFile], selfie :: Maybe DatedFile.DatedFile, reverse_side :: Maybe DatedFile.DatedFile, front_side :: Maybe DatedFile.DatedFile, _data :: Maybe String, _type :: Maybe PassportElementType.PassportElementType }  deriving (Show, Eq)

instance T.ToJSON EncryptedPassportElement where
 toJSON (EncryptedPassportElement { hash = hash, value = value, files = files, translation = translation, selfie = selfie, reverse_side = reverse_side, front_side = front_side, _data = _data, _type = _type }) =
  A.object [ "@type" A..= T.String "encryptedPassportElement", "hash" A..= hash, "value" A..= value, "files" A..= files, "translation" A..= translation, "selfie" A..= selfie, "reverse_side" A..= reverse_side, "front_side" A..= front_side, "data" A..= _data, "type" A..= _type ]

instance T.FromJSON EncryptedPassportElement where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "encryptedPassportElement" -> parseEncryptedPassportElement v
   _ -> mempty
  where
   parseEncryptedPassportElement :: A.Value -> T.Parser EncryptedPassportElement
   parseEncryptedPassportElement = A.withObject "EncryptedPassportElement" $ \o -> do
    hash <- o A..:? "hash"
    value <- o A..:? "value"
    files <- o A..:? "files"
    translation <- o A..:? "translation"
    selfie <- o A..:? "selfie"
    reverse_side <- o A..:? "reverse_side"
    front_side <- o A..:? "front_side"
    _data <- o A..:? "data"
    _type <- o A..:? "type"
    return $ EncryptedPassportElement { hash = hash, value = value, files = files, translation = translation, selfie = selfie, reverse_side = reverse_side, front_side = front_side, _data = _data, _type = _type }