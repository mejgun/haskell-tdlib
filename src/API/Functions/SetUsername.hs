-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetUsername where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data SetUsername = 
 SetUsername { username :: String }  -- deriving (Show)

instance T.ToJSON SetUsername where
 toJSON (SetUsername { username = username }) =
  A.object [ "@type" A..= T.String "setUsername", "username" A..= username ]
-- setUsername SetUsername  { username :: String } 



instance T.FromJSON SetUsername where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setUsername" -> parseSetUsername v
  where
   parseSetUsername :: A.Value -> T.Parser SetUsername
   parseSetUsername = A.withObject "SetUsername" $ \o -> do
    username <- o A..: "username"
    return $ SetUsername { username = username }