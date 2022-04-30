-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetPasswordState where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Returns the current state of 2-step verification
data GetPasswordState = 

 GetPasswordState deriving (Eq)

instance Show GetPasswordState where
 show GetPasswordState {  } =
  "GetPasswordState" ++ U.cc [ ]

instance T.ToJSON GetPasswordState where
 toJSON GetPasswordState {  } =
  A.object [ "@type" A..= T.String "getPasswordState" ]

instance T.FromJSON GetPasswordState where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getPasswordState" -> parseGetPasswordState v
   _ -> mempty
  where
   parseGetPasswordState :: A.Value -> T.Parser GetPasswordState
   parseGetPasswordState = A.withObject "GetPasswordState" $ \o -> do
    return $ GetPasswordState {  }
 parseJSON _ = mempty
