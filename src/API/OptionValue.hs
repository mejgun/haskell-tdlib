-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.OptionValue where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Represents the value of an option
data OptionValue = 
 OptionValueBoolean { __value :: Maybe Bool }  
 | OptionValueEmpty 
 | OptionValueInteger { _value :: Maybe Int }  
 | OptionValueString { value :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON OptionValue where
 toJSON (OptionValueBoolean { __value = __value }) =
  A.object [ "@type" A..= T.String "optionValueBoolean", "value" A..= __value ]

 toJSON (OptionValueEmpty {  }) =
  A.object [ "@type" A..= T.String "optionValueEmpty" ]

 toJSON (OptionValueInteger { _value = _value }) =
  A.object [ "@type" A..= T.String "optionValueInteger", "value" A..= _value ]

 toJSON (OptionValueString { value = value }) =
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
    _value <- mconcat [ o A..:? "_value", readMaybe <$> (o A..: "_value" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ OptionValueInteger { _value = _value }

   parseOptionValueString :: A.Value -> T.Parser OptionValue
   parseOptionValueString = A.withObject "OptionValueString" $ \o -> do
    value <- o A..:? "value"
    return $ OptionValueString { value = value }