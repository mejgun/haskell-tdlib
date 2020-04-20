-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.IdentityDocument where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.DatedFile as DatedFile
import {-# SOURCE #-} qualified API.Date as Date

--main = putStrLn "ok"

data IdentityDocument = 
 IdentityDocument { translation :: [DatedFile.DatedFile], selfie :: DatedFile.DatedFile, reverse_side :: DatedFile.DatedFile, front_side :: DatedFile.DatedFile, expiry_date :: Date.Date, number :: String }  -- deriving (Show)

instance T.ToJSON IdentityDocument where
 toJSON (IdentityDocument { translation = translation, selfie = selfie, reverse_side = reverse_side, front_side = front_side, expiry_date = expiry_date, number = number }) =
  A.object [ "@type" A..= T.String "identityDocument", "translation" A..= translation, "selfie" A..= selfie, "reverse_side" A..= reverse_side, "front_side" A..= front_side, "expiry_date" A..= expiry_date, "number" A..= number ]
-- identityDocument IdentityDocument  { translation :: [DatedFile.DatedFile], selfie :: DatedFile.DatedFile, reverse_side :: DatedFile.DatedFile, front_side :: DatedFile.DatedFile, expiry_date :: Date.Date, number :: String } 

