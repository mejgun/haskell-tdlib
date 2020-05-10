-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetLogVerbosityLevel where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Sets the verbosity level of the internal logging of TDLib. This is an offline method. Can be called before authorization. Can be called synchronously
-- 
-- __new_verbosity_level__ New value of the verbosity level for logging. Value 0 corresponds to fatal errors, value 1 corresponds to errors, value 2 corresponds to warnings and debug warnings, value 3 corresponds to informational, value 4 corresponds to debug, value 5 corresponds to verbose debug, value greater than 5 and up to 1023 can be used to enable even more logging
data SetLogVerbosityLevel = 

 SetLogVerbosityLevel { new_verbosity_level :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON SetLogVerbosityLevel where
 toJSON (SetLogVerbosityLevel { new_verbosity_level = new_verbosity_level }) =
  A.object [ "@type" A..= T.String "setLogVerbosityLevel", "new_verbosity_level" A..= new_verbosity_level ]

instance T.FromJSON SetLogVerbosityLevel where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setLogVerbosityLevel" -> parseSetLogVerbosityLevel v
   _ -> mempty
  where
   parseSetLogVerbosityLevel :: A.Value -> T.Parser SetLogVerbosityLevel
   parseSetLogVerbosityLevel = A.withObject "SetLogVerbosityLevel" $ \o -> do
    new_verbosity_level <- mconcat [ o A..:? "new_verbosity_level", readMaybe <$> (o A..: "new_verbosity_level" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ SetLogVerbosityLevel { new_verbosity_level = new_verbosity_level }