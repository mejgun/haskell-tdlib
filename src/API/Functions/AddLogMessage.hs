-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.AddLogMessage where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data AddLogMessage = 
 AddLogMessage { text :: String, verbosity_level :: Int }  deriving (Show)

instance T.ToJSON AddLogMessage where
 toJSON (AddLogMessage { text = text, verbosity_level = verbosity_level }) =
  A.object [ "@type" A..= T.String "addLogMessage", "text" A..= text, "verbosity_level" A..= verbosity_level ]



instance T.FromJSON AddLogMessage where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "addLogMessage" -> parseAddLogMessage v

   _ -> mempty ""
  where
   parseAddLogMessage :: A.Value -> T.Parser AddLogMessage
   parseAddLogMessage = A.withObject "AddLogMessage" $ \o -> do
    text <- o A..: "text"
    verbosity_level <- o A..: "verbosity_level"
    return $ AddLogMessage { text = text, verbosity_level = verbosity_level }