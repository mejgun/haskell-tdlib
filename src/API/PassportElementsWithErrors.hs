-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PassportElementsWithErrors where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.PassportElementError as PassportElementError
import {-# SOURCE #-} qualified API.PassportElement as PassportElement

--main = putStrLn "ok"

data PassportElementsWithErrors = 
 PassportElementsWithErrors { errors :: [PassportElementError.PassportElementError], elements :: [PassportElement.PassportElement] }  deriving (Show)

instance T.ToJSON PassportElementsWithErrors where
 toJSON (PassportElementsWithErrors { errors = errors, elements = elements }) =
  A.object [ "@type" A..= T.String "passportElementsWithErrors", "errors" A..= errors, "elements" A..= elements ]



instance T.FromJSON PassportElementsWithErrors where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "passportElementsWithErrors" -> parsePassportElementsWithErrors v

   _ -> mempty ""
  where
   parsePassportElementsWithErrors :: A.Value -> T.Parser PassportElementsWithErrors
   parsePassportElementsWithErrors = A.withObject "PassportElementsWithErrors" $ \o -> do
    errors <- o A..: "errors"
    elements <- o A..: "elements"
    return $ PassportElementsWithErrors { errors = errors, elements = elements }