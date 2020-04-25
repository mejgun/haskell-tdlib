-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetPassportElement where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.InputPassportElement as InputPassportElement

data SetPassportElement = 
 SetPassportElement { password :: Maybe String, element :: Maybe InputPassportElement.InputPassportElement }  deriving (Show, Eq)

instance T.ToJSON SetPassportElement where
 toJSON (SetPassportElement { password = password, element = element }) =
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