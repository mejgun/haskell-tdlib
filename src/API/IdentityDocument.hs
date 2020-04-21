-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.IdentityDocument where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.DatedFile as DatedFile
import {-# SOURCE #-} qualified API.Date as Date

data IdentityDocument = 
 IdentityDocument { translation :: [DatedFile.DatedFile], selfie :: DatedFile.DatedFile, reverse_side :: DatedFile.DatedFile, front_side :: DatedFile.DatedFile, expiry_date :: Date.Date, number :: String }  deriving (Show)

instance T.ToJSON IdentityDocument where
 toJSON (IdentityDocument { translation = translation, selfie = selfie, reverse_side = reverse_side, front_side = front_side, expiry_date = expiry_date, number = number }) =
  A.object [ "@type" A..= T.String "identityDocument", "translation" A..= translation, "selfie" A..= selfie, "reverse_side" A..= reverse_side, "front_side" A..= front_side, "expiry_date" A..= expiry_date, "number" A..= number ]

instance T.FromJSON IdentityDocument where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "identityDocument" -> parseIdentityDocument v
   _ -> mempty
  where
   parseIdentityDocument :: A.Value -> T.Parser IdentityDocument
   parseIdentityDocument = A.withObject "IdentityDocument" $ \o -> do
    translation <- o A..: "translation"
    selfie <- o A..: "selfie"
    reverse_side <- o A..: "reverse_side"
    front_side <- o A..: "front_side"
    expiry_date <- o A..: "expiry_date"
    number <- o A..: "number"
    return $ IdentityDocument { translation = translation, selfie = selfie, reverse_side = reverse_side, front_side = front_side, expiry_date = expiry_date, number = number }