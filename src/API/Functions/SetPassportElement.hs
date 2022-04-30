-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetPassportElement where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.InputPassportElement as InputPassportElement

-- |
-- 
-- Adds an element to the user's Telegram Passport. May return an error with a message "PHONE_VERIFICATION_NEEDED" or "EMAIL_VERIFICATION_NEEDED" if the chosen phone number or the chosen email address must be verified first 
-- 
-- __element__ Input Telegram Passport element
-- 
-- __password__ Password of the current user
data SetPassportElement = 

 SetPassportElement { password :: Maybe String, element :: Maybe InputPassportElement.InputPassportElement }  deriving (Eq)

instance Show SetPassportElement where
 show SetPassportElement { password=password, element=element } =
  "SetPassportElement" ++ U.cc [U.p "password" password, U.p "element" element ]

instance T.ToJSON SetPassportElement where
 toJSON SetPassportElement { password = password, element = element } =
  A.object [ "@type" A..= T.String "setPassportElement", "password" A..= password, "element" A..= element ]

instance T.FromJSON SetPassportElement where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setPassportElement" -> parseSetPassportElement v
   _ -> mempty
  where
   parseSetPassportElement :: A.Value -> T.Parser SetPassportElement
   parseSetPassportElement = A.withObject "SetPassportElement" $ \o -> do
    password <- o A..:? "password"
    element <- o A..:? "element"
    return $ SetPassportElement { password = password, element = element }
 parseJSON _ = mempty
