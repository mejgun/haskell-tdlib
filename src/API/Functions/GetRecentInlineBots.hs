-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetRecentInlineBots where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetRecentInlineBots = 
 GetRecentInlineBots -- deriving (Show)

instance T.ToJSON GetRecentInlineBots where
 toJSON (GetRecentInlineBots {  }) =
  A.object [ "@type" A..= T.String "getRecentInlineBots" ]
-- getRecentInlineBots GetRecentInlineBots 

