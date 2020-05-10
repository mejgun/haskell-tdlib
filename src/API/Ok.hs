-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Ok where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- An object of this type is returned on a successful function call for certain functions
data Ok = 

 Ok deriving (Show, Eq)

instance T.ToJSON Ok where
 toJSON (Ok {  }) =
  A.object [ "@type" A..= T.String "ok" ]

instance T.FromJSON Ok where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "ok" -> parseOk v
   _ -> mempty
  where
   parseOk :: A.Value -> T.Parser Ok
   parseOk = A.withObject "Ok" $ \o -> do
    return $ Ok {  }