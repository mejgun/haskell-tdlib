-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.AddLogMessage where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Adds a message to TDLib internal log. Can be called synchronously
-- 
-- __verbosity_level__ The minimum verbosity level needed for the message to be logged; 0-1023
-- 
-- __text__ Text of a message to log
data AddLogMessage = 

 AddLogMessage { text :: Maybe String, verbosity_level :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON AddLogMessage where
 toJSON (AddLogMessage { text = text, verbosity_level = verbosity_level }) =
  A.object [ "@type" A..= T.String "addLogMessage", "text" A..= text, "verbosity_level" A..= verbosity_level ]

instance T.FromJSON AddLogMessage where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "addLogMessage" -> parseAddLogMessage v
   _ -> mempty
  where
   parseAddLogMessage :: A.Value -> T.Parser AddLogMessage
   parseAddLogMessage = A.withObject "AddLogMessage" $ \o -> do
    text <- o A..:? "text"
    verbosity_level <- mconcat [ o A..:? "verbosity_level", readMaybe <$> (o A..: "verbosity_level" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ AddLogMessage { text = text, verbosity_level = verbosity_level }