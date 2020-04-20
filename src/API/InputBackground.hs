-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.InputBackground where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.InputFile as InputFile

--main = putStrLn "ok"

data InputBackground = 
 InputBackgroundLocal { background :: InputFile.InputFile }  
 | InputBackgroundRemote { background_id :: Int }  -- deriving (Show)

instance T.ToJSON InputBackground where
 toJSON (InputBackgroundLocal { background = background }) =
  A.object [ "@type" A..= T.String "inputBackgroundLocal", "background" A..= background ]

 toJSON (InputBackgroundRemote { background_id = background_id }) =
  A.object [ "@type" A..= T.String "inputBackgroundRemote", "background_id" A..= background_id ]
-- inputBackgroundLocal InputBackground  { background :: InputFile.InputFile } 

-- inputBackgroundRemote InputBackground  { background_id :: Int } 



instance T.FromJSON InputBackground where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "inputBackgroundLocal" -> parseInputBackgroundLocal v
   "inputBackgroundRemote" -> parseInputBackgroundRemote v
  where
   parseInputBackgroundLocal :: A.Value -> T.Parser InputBackground
   parseInputBackgroundLocal = A.withObject "InputBackgroundLocal" $ \o -> do
    background <- o A..: "background"
    return $ InputBackgroundLocal { background = background }

   parseInputBackgroundRemote :: A.Value -> T.Parser InputBackground
   parseInputBackgroundRemote = A.withObject "InputBackgroundRemote" $ \o -> do
    background_id <- o A..: "background_id"
    return $ InputBackgroundRemote { background_id = background_id }