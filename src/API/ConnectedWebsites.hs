-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ConnectedWebsites where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ConnectedWebsite as ConnectedWebsite

--main = putStrLn "ok"

data ConnectedWebsites = 
 ConnectedWebsites { websites :: [ConnectedWebsite.ConnectedWebsite] }  -- deriving (Show)

instance T.ToJSON ConnectedWebsites where
 toJSON (ConnectedWebsites { websites = websites }) =
  A.object [ "@type" A..= T.String "connectedWebsites", "websites" A..= websites ]
-- connectedWebsites ConnectedWebsites  { websites :: [ConnectedWebsite.ConnectedWebsite] } 

