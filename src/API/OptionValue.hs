-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.OptionValue where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data OptionValue = 
 OptionValueBoolean { __value :: Bool }  
 | OptionValueEmpty 
 | OptionValueInteger { _value :: Int }  
 | OptionValueString { value :: String }  -- deriving (Show)

instance T.ToJSON OptionValue where
 toJSON (OptionValueBoolean { __value = __value }) =
  A.object [ "@type" A..= T.String "optionValueBoolean", "value" A..= __value ]

 toJSON (OptionValueEmpty {  }) =
  A.object [ "@type" A..= T.String "optionValueEmpty" ]

 toJSON (OptionValueInteger { _value = _value }) =
  A.object [ "@type" A..= T.String "optionValueInteger", "value" A..= _value ]

 toJSON (OptionValueString { value = value }) =
  A.object [ "@type" A..= T.String "optionValueString", "value" A..= value ]
-- optionValueBoolean OptionValue  { __value :: Bool } 

-- optionValueEmpty OptionValue 

-- optionValueInteger OptionValue  { _value :: Int } 

-- optionValueString OptionValue  { value :: String } 

