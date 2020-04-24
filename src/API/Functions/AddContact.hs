-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.AddContact where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.Contact as Contact

data AddContact = 
 AddContact { share_phone_number :: Maybe Bool, contact :: Maybe Contact.Contact }  deriving (Show, Eq)

instance T.ToJSON AddContact where
 toJSON (AddContact { share_phone_number = share_phone_number, contact = contact }) =
  A.object [ "@type" A..= T.String "addContact", "share_phone_number" A..= share_phone_number, "contact" A..= contact ]

instance T.FromJSON AddContact where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "addContact" -> parseAddContact v
   _ -> mempty
  where
   parseAddContact :: A.Value -> T.Parser AddContact
   parseAddContact = A.withObject "AddContact" $ \o -> do
    share_phone_number <- optional $ o A..: "share_phone_number"
    contact <- optional $ o A..: "contact"
    return $ AddContact { share_phone_number = share_phone_number, contact = contact }