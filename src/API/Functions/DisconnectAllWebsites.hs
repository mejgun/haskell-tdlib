-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.DisconnectAllWebsites where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data DisconnectAllWebsites = 
 DisconnectAllWebsites -- deriving (Show)

instance T.ToJSON DisconnectAllWebsites where
 toJSON (DisconnectAllWebsites {  }) =
  A.object [ "@type" A..= T.String "disconnectAllWebsites" ]
-- disconnectAllWebsites DisconnectAllWebsites 



instance T.FromJSON DisconnectAllWebsites where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "disconnectAllWebsites" -> parseDisconnectAllWebsites v
  where
   parseDisconnectAllWebsites :: A.Value -> T.Parser DisconnectAllWebsites
   parseDisconnectAllWebsites = A.withObject "DisconnectAllWebsites" $ \o -> do
    return $ DisconnectAllWebsites {  }