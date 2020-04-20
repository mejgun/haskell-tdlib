-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetOption where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.OptionValue as OptionValue

--main = putStrLn "ok"

data SetOption = 
 SetOption { value :: OptionValue.OptionValue, name :: String }  -- deriving (Show)

instance T.ToJSON SetOption where
 toJSON (SetOption { value = value, name = name }) =
  A.object [ "@type" A..= T.String "setOption", "value" A..= value, "name" A..= name ]
-- setOption SetOption  { value :: OptionValue.OptionValue, name :: String } 



instance T.FromJSON SetOption where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setOption" -> parseSetOption v
  where
   parseSetOption :: A.Value -> T.Parser SetOption
   parseSetOption = A.withObject "SetOption" $ \o -> do
    value <- o A..: "value"
    name <- o A..: "name"
    return $ SetOption { value = value, name = name }