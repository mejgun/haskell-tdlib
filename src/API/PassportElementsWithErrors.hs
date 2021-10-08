-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PassportElementsWithErrors where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.PassportElementError as PassportElementError
import {-# SOURCE #-} qualified API.PassportElement as PassportElement

-- |
-- 
-- Contains information about a Telegram Passport elements and corresponding errors 
-- 
-- __elements__ Telegram Passport elements
-- 
-- __errors__ Errors in the elements that are already available
data PassportElementsWithErrors = 

 PassportElementsWithErrors { errors :: Maybe [PassportElementError.PassportElementError], elements :: Maybe [PassportElement.PassportElement] }  deriving (Eq)

instance Show PassportElementsWithErrors where
 show PassportElementsWithErrors { errors=errors, elements=elements } =
  "PassportElementsWithErrors" ++ cc [p "errors" errors, p "elements" elements ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON PassportElementsWithErrors where
 toJSON PassportElementsWithErrors { errors = errors, elements = elements } =
  A.object [ "@type" A..= T.String "passportElementsWithErrors", "errors" A..= errors, "elements" A..= elements ]

instance T.FromJSON PassportElementsWithErrors where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "passportElementsWithErrors" -> parsePassportElementsWithErrors v
   _ -> mempty
  where
   parsePassportElementsWithErrors :: A.Value -> T.Parser PassportElementsWithErrors
   parsePassportElementsWithErrors = A.withObject "PassportElementsWithErrors" $ \o -> do
    errors <- o A..:? "errors"
    elements <- o A..:? "elements"
    return $ PassportElementsWithErrors { errors = errors, elements = elements }
 parseJSON _ = mempty
