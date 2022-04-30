-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetOption where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.OptionValue as OptionValue

-- |
-- 
-- Sets the value of an option. (Check the list of available options on https://core.telegram.org/tdlib/options.) Only writable options can be set. Can be called before authorization
-- 
-- __name__ The name of the option
-- 
-- __value__ The new value of the option; pass null to reset option value to a default value
data SetOption = 

 SetOption { value :: Maybe OptionValue.OptionValue, name :: Maybe String }  deriving (Eq)

instance Show SetOption where
 show SetOption { value=value, name=name } =
  "SetOption" ++ U.cc [U.p "value" value, U.p "name" name ]

instance T.ToJSON SetOption where
 toJSON SetOption { value = value, name = name } =
  A.object [ "@type" A..= T.String "setOption", "value" A..= value, "name" A..= name ]

instance T.FromJSON SetOption where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setOption" -> parseSetOption v
   _ -> mempty
  where
   parseSetOption :: A.Value -> T.Parser SetOption
   parseSetOption = A.withObject "SetOption" $ \o -> do
    value <- o A..:? "value"
    name <- o A..:? "name"
    return $ SetOption { value = value, name = name }
 parseJSON _ = mempty
