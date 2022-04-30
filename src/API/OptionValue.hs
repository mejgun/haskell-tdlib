-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.OptionValue where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Represents the value of an option
data OptionValue = 
 -- |
 -- 
 -- Represents a boolean option 
 -- 
 -- __value__ The value of the option
 OptionValueBoolean { __value :: Maybe Bool }  |
 -- |
 -- 
 -- Represents an unknown option or an option which has a default value
 OptionValueEmpty |
 -- |
 -- 
 -- Represents an integer option 
 -- 
 -- __value__ The value of the option
 OptionValueInteger { _value :: Maybe Int }  |
 -- |
 -- 
 -- Represents a string option 
 -- 
 -- __value__ The value of the option
 OptionValueString { value :: Maybe String }  deriving (Eq)

instance Show OptionValue where
 show OptionValueBoolean { __value=__value } =
  "OptionValueBoolean" ++ U.cc [U.p "__value" __value ]

 show OptionValueEmpty {  } =
  "OptionValueEmpty" ++ U.cc [ ]

 show OptionValueInteger { _value=_value } =
  "OptionValueInteger" ++ U.cc [U.p "_value" _value ]

 show OptionValueString { value=value } =
  "OptionValueString" ++ U.cc [U.p "value" value ]

instance T.ToJSON OptionValue where
 toJSON OptionValueBoolean { __value = __value } =
  A.object [ "@type" A..= T.String "optionValueBoolean", "value" A..= __value ]

 toJSON OptionValueEmpty {  } =
  A.object [ "@type" A..= T.String "optionValueEmpty" ]

 toJSON OptionValueInteger { _value = _value } =
  A.object [ "@type" A..= T.String "optionValueInteger", "value" A..= _value ]

 toJSON OptionValueString { value = value } =
  A.object [ "@type" A..= T.String "optionValueString", "value" A..= value ]

instance T.FromJSON OptionValue where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "optionValueBoolean" -> parseOptionValueBoolean v
   "optionValueEmpty" -> parseOptionValueEmpty v
   "optionValueInteger" -> parseOptionValueInteger v
   "optionValueString" -> parseOptionValueString v
   _ -> mempty
  where
   parseOptionValueBoolean :: A.Value -> T.Parser OptionValue
   parseOptionValueBoolean = A.withObject "OptionValueBoolean" $ \o -> do
    __value <- o A..:? "value"
    return $ OptionValueBoolean { __value = __value }

   parseOptionValueEmpty :: A.Value -> T.Parser OptionValue
   parseOptionValueEmpty = A.withObject "OptionValueEmpty" $ \o -> do
    return $ OptionValueEmpty {  }

   parseOptionValueInteger :: A.Value -> T.Parser OptionValue
   parseOptionValueInteger = A.withObject "OptionValueInteger" $ \o -> do
    _value <- mconcat [ o A..:? "value", readMaybe <$> (o A..: "value" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ OptionValueInteger { _value = _value }

   parseOptionValueString :: A.Value -> T.Parser OptionValue
   parseOptionValueString = A.withObject "OptionValueString" $ \o -> do
    value <- o A..:? "value"
    return $ OptionValueString { value = value }
 parseJSON _ = mempty
