-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.InputBackground where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.InputFile as InputFile

-- |
-- 
-- Contains information about background to set
data InputBackground = 
 -- |
 -- 
 -- A background from a local file
 -- 
 -- __background__ Background file to use. Only inputFileLocal and inputFileGenerated are supported. The file must be in JPEG format for wallpapers and in PNG format for patterns
 InputBackgroundLocal { background :: Maybe InputFile.InputFile }  |
 -- |
 -- 
 -- A background from the server 
 -- 
 -- __background_id__ The background identifier
 InputBackgroundRemote { background_id :: Maybe Int }  deriving (Show, Eq)

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
    background <- o A..:? "background"
    return $ InputBackgroundLocal { background = background }

   parseInputBackgroundRemote :: A.Value -> T.Parser InputBackground
   parseInputBackgroundRemote = A.withObject "InputBackgroundRemote" $ \o -> do
    background_id <- mconcat [ o A..:? "background_id", readMaybe <$> (o A..: "background_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ InputBackgroundRemote { background_id = background_id }