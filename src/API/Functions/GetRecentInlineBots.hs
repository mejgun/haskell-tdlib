-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetRecentInlineBots where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Returns up to 20 recently used inline bots in the order of their last usage
data GetRecentInlineBots = 

 GetRecentInlineBots deriving (Eq)

instance Show GetRecentInlineBots where
 show GetRecentInlineBots {  } =
  "GetRecentInlineBots" ++ U.cc [ ]

instance T.ToJSON GetRecentInlineBots where
 toJSON GetRecentInlineBots {  } =
  A.object [ "@type" A..= T.String "getRecentInlineBots" ]

instance T.FromJSON GetRecentInlineBots where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getRecentInlineBots" -> parseGetRecentInlineBots v
   _ -> mempty
  where
   parseGetRecentInlineBots :: A.Value -> T.Parser GetRecentInlineBots
   parseGetRecentInlineBots = A.withObject "GetRecentInlineBots" $ \o -> do
    return $ GetRecentInlineBots {  }
 parseJSON _ = mempty
