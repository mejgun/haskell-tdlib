-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.AddLogMessage where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data AddLogMessage = 
 AddLogMessage { text :: Maybe String, verbosity_level :: Maybe Int }  deriving (Show)

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
    text <- optional $ o A..: "text"
    verbosity_level <- optional $ o A..: "verbosity_level"
    return $ AddLogMessage { text = text, verbosity_level = verbosity_level }