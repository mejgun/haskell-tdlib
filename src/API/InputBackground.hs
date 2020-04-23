-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.InputBackground where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.InputFile as InputFile

data InputBackground = 
 InputBackgroundLocal { background :: Maybe InputFile.InputFile }  
 | InputBackgroundRemote { background_id :: Maybe Int }  deriving (Show)

instance T.ToJSON InputBackground where
 toJSON (InputBackgroundLocal { background = background }) =
  A.object [ "@type" A..= T.String "inputBackgroundLocal", "background" A..= background ]

 toJSON (InputBackgroundRemote { background_id = background_id }) =
  A.object [ "@type" A..= T.String "inputBackgroundRemote", "background_id" A..= background_id ]

instance T.FromJSON InputBackground where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "inputBackgroundLocal" -> parseInputBackgroundLocal v
   "inputBackgroundRemote" -> parseInputBackgroundRemote v
   _ -> mempty
  where
   parseInputBackgroundLocal :: A.Value -> T.Parser InputBackground
   parseInputBackgroundLocal = A.withObject "InputBackgroundLocal" $ \o -> do
    background <- optional $ o A..: "background"
    return $ InputBackgroundLocal { background = background }

   parseInputBackgroundRemote :: A.Value -> T.Parser InputBackground
   parseInputBackgroundRemote = A.withObject "InputBackgroundRemote" $ \o -> do
    background_id <- optional $ o A..: "background_id"
    return $ InputBackgroundRemote { background_id = background_id }