-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.AddContact where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.Contact as Contact

--main = putStrLn "ok"

data AddContact = 
 AddContact { share_phone_number :: Bool, contact :: Contact.Contact }  -- deriving (Show)

instance T.ToJSON AddContact where
 toJSON (AddContact { share_phone_number = share_phone_number, contact = contact }) =
  A.object [ "@type" A..= T.String "addContact", "share_phone_number" A..= share_phone_number, "contact" A..= contact ]
-- addContact AddContact  { share_phone_number :: Bool, contact :: Contact.Contact } 



instance T.FromJSON AddContact where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "addContact" -> parseAddContact v
  where
   parseAddContact :: A.Value -> T.Parser AddContact
   parseAddContact = A.withObject "AddContact" $ \o -> do
    share_phone_number <- o A..: "share_phone_number"
    contact <- o A..: "contact"
    return $ AddContact { share_phone_number = share_phone_number, contact = contact }