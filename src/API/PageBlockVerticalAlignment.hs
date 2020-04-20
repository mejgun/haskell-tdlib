-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PageBlockVerticalAlignment where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data PageBlockVerticalAlignment = 
 PageBlockVerticalAlignmentTop 
 | PageBlockVerticalAlignmentMiddle 
 | PageBlockVerticalAlignmentBottom -- deriving (Show)

instance T.ToJSON PageBlockVerticalAlignment where
 toJSON (PageBlockVerticalAlignmentTop {  }) =
  A.object [ "@type" A..= T.String "pageBlockVerticalAlignmentTop" ]

 toJSON (PageBlockVerticalAlignmentMiddle {  }) =
  A.object [ "@type" A..= T.String "pageBlockVerticalAlignmentMiddle" ]

 toJSON (PageBlockVerticalAlignmentBottom {  }) =
  A.object [ "@type" A..= T.String "pageBlockVerticalAlignmentBottom" ]
-- pageBlockVerticalAlignmentTop PageBlockVerticalAlignment 

-- pageBlockVerticalAlignmentMiddle PageBlockVerticalAlignment 

-- pageBlockVerticalAlignmentBottom PageBlockVerticalAlignment 

