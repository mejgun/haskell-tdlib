-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetTemporaryPasswordState where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Returns information about the current temporary password
data GetTemporaryPasswordState = 

 GetTemporaryPasswordState deriving (Eq)

instance Show GetTemporaryPasswordState where
 show GetTemporaryPasswordState {  } =
  "GetTemporaryPasswordState" ++ U.cc [ ]

instance T.ToJSON GetTemporaryPasswordState where
 toJSON GetTemporaryPasswordState {  } =
  A.object [ "@type" A..= T.String "getTemporaryPasswordState" ]

instance T.FromJSON GetTemporaryPasswordState where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getTemporaryPasswordState" -> parseGetTemporaryPasswordState v
   _ -> mempty
  where
   parseGetTemporaryPasswordState :: A.Value -> T.Parser GetTemporaryPasswordState
   parseGetTemporaryPasswordState = A.withObject "GetTemporaryPasswordState" $ \o -> do
    return $ GetTemporaryPasswordState {  }
 parseJSON _ = mempty
