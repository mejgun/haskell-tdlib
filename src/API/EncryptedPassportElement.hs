-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.EncryptedPassportElement where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.DatedFile as DatedFile
import {-# SOURCE #-} qualified API.PassportElementType as PassportElementType

--main = putStrLn "ok"

data EncryptedPassportElement = 
 EncryptedPassportElement { hash :: String, value :: String, files :: [DatedFile.DatedFile], translation :: [DatedFile.DatedFile], selfie :: DatedFile.DatedFile, reverse_side :: DatedFile.DatedFile, front_side :: DatedFile.DatedFile, _data :: String, _type :: PassportElementType.PassportElementType }  -- deriving (Show)

instance T.ToJSON EncryptedPassportElement where
 toJSON (EncryptedPassportElement { hash = hash, value = value, files = files, translation = translation, selfie = selfie, reverse_side = reverse_side, front_side = front_side, _data = _data, _type = _type }) =
  A.object [ "@type" A..= T.String "encryptedPassportElement", "hash" A..= hash, "value" A..= value, "files" A..= files, "translation" A..= translation, "selfie" A..= selfie, "reverse_side" A..= reverse_side, "front_side" A..= front_side, "data" A..= _data, "type" A..= _type ]
-- encryptedPassportElement EncryptedPassportElement  { hash :: String, value :: String, files :: [DatedFile.DatedFile], translation :: [DatedFile.DatedFile], selfie :: DatedFile.DatedFile, reverse_side :: DatedFile.DatedFile, front_side :: DatedFile.DatedFile, _data :: String, _type :: PassportElementType.PassportElementType } 

