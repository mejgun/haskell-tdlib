-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PassportRequiredElement where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.PassportSuitableElement as PassportSuitableElement

data PassportRequiredElement = 
 PassportRequiredElement { suitable_elements :: Maybe [PassportSuitableElement.PassportSuitableElement] }  deriving (Show)

instance T.ToJSON PassportRequiredElement where
 toJSON (PassportRequiredElement { suitable_elements = suitable_elements }) =
  A.object [ "@type" A..= T.String "passportRequiredElement", "suitable_elements" A..= suitable_elements ]

instance T.FromJSON PassportRequiredElement where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "passportRequiredElement" -> parsePassportRequiredElement v
   _ -> mempty
  where
   parsePassportRequiredElement :: A.Value -> T.Parser PassportRequiredElement
   parsePassportRequiredElement = A.withObject "PassportRequiredElement" $ \o -> do
    suitable_elements <- optional $ o A..: "suitable_elements"
    return $ PassportRequiredElement { suitable_elements = suitable_elements }