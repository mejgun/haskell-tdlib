-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.InputPassportElementError where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.InputPassportElementErrorSource as InputPassportElementErrorSource
import {-# SOURCE #-} qualified API.PassportElementType as PassportElementType

-- |
-- 
-- Contains the description of an error in a Telegram Passport element; for bots only 
-- 
-- __type__ Type of Telegram Passport element that has the error
-- 
-- __message__ Error message
-- 
-- __source__ Error source
data InputPassportElementError = 

 InputPassportElementError { source :: Maybe InputPassportElementErrorSource.InputPassportElementErrorSource, message :: Maybe String, _type :: Maybe PassportElementType.PassportElementType }  deriving (Eq)

instance Show InputPassportElementError where
 show InputPassportElementError { source=source, message=message, _type=_type } =
  "InputPassportElementError" ++ cc [p "source" source, p "message" message, p "_type" _type ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON InputPassportElementError where
 toJSON InputPassportElementError { source = source, message = message, _type = _type } =
  A.object [ "@type" A..= T.String "inputPassportElementError", "source" A..= source, "message" A..= message, "type" A..= _type ]

instance T.FromJSON InputPassportElementError where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "inputPassportElementError" -> parseInputPassportElementError v
   _ -> mempty
  where
   parseInputPassportElementError :: A.Value -> T.Parser InputPassportElementError
   parseInputPassportElementError = A.withObject "InputPassportElementError" $ \o -> do
    source <- o A..:? "source"
    message <- o A..:? "message"
    _type <- o A..:? "type"
    return $ InputPassportElementError { source = source, message = message, _type = _type }
 parseJSON _ = mempty
