-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetUsername where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Changes the username of the current user. If something changes, updateUser will be sent 
-- 
-- __username__ The new value of the username. Use an empty string to remove the username
data SetUsername = 

 SetUsername { username :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON SetUsername where
 toJSON (SetUsername { username = username }) =
  A.object [ "@type" A..= T.String "setUsername", "username" A..= username ]

instance T.FromJSON SetUsername where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setUsername" -> parseSetUsername v
   _ -> mempty
  where
   parseSetUsername :: A.Value -> T.Parser SetUsername
   parseSetUsername = A.withObject "SetUsername" $ \o -> do
    username <- o A..:? "username"
    return $ SetUsername { username = username }