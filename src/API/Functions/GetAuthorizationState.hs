-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetAuthorizationState where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Returns the current authorization state; this is an offline request. For informational purposes only. Use updateAuthorizationState instead to maintain the current authorization state. Can be called before initialization
data GetAuthorizationState = 

 GetAuthorizationState deriving (Eq)

instance Show GetAuthorizationState where
 show GetAuthorizationState {  } =
  "GetAuthorizationState" ++ U.cc [ ]

instance T.ToJSON GetAuthorizationState where
 toJSON GetAuthorizationState {  } =
  A.object [ "@type" A..= T.String "getAuthorizationState" ]

instance T.FromJSON GetAuthorizationState where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getAuthorizationState" -> parseGetAuthorizationState v
   _ -> mempty
  where
   parseGetAuthorizationState :: A.Value -> T.Parser GetAuthorizationState
   parseGetAuthorizationState = A.withObject "GetAuthorizationState" $ \o -> do
    return $ GetAuthorizationState {  }
 parseJSON _ = mempty
